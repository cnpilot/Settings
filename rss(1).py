import feedparser, requests, subprocess, os
import time
import requests
import re
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

base_path = "/root/rss"

sites = ['hdb_uhd']
urls = [
'rss_link'
]

cookies = ['']


site_limits = ['688597']


ttg_passkey = ''

now_date = time.strftime("%Y-%m-%d", time.localtime())
headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36'}
if not os.path.exists(base_path):
    os.makedirs(base_path)


key_word=[
    'ttg',
    'BDISO洗版计划',
    'dave',
    'wiki',
    'ngb'
]

key_word2=[
    'hds'
]

negative_keywords=[
    'hdspad',
    'chdpad',
    'remux'
]

hdb_imdb_mapping = {}
ptp_imdb_mapping = {}

def get_imdb_id(url, cookie):
    headers = {
        "Cookie": cookie,
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36",
    }
    r = requests.get(url, allow_redirects=True, headers=headers)
    imdb_id = ""
    try:
        imdb_id = re.search(r'title/(tt\d+)', r.text)
        if imdb_id:
            imdb_id = imdb_id.group(1)
    except:
        imdb_id = ""
    return imdb_id

for i in range(0, len(sites)):
    site = sites[i]
    url = urls[i]
    limit = site_limits[i]
    feed = feedparser.parse(url)
    nk = False
    for item in feed.entries:
        for keyword in negative_keywords:
            if (keyword.lower() in item.title.lower()):
                nk = True
                continue
    if nk:
        continue
    if site=='putao':
        raw_links = [item.link for item in feed.entries]
        download_links = raw_links
    elif site=='ttg':
        raw_links = []
        download_links = []
        for jj in feed.entries:
            for ii in key_word:
                if(jj.title.lower().find(ii.lower())!=-1):
                    raw_links.append(jj.link)
                    download_links.append(jj.links[1].href)
    elif 'hds' in site:
        raw_links = []
        download_links = []
        for jj in feed.entries:
            for ii in key_word2:
                if(jj.title.lower().find(ii.lower())!=-1):
                    raw_links.append(jj.link)
                    download_links.append(jj.links[1].href)
    elif 'hdb' in site:
        raw_links = []
        download_links = []
        for t in feed.entries:
            link = t.link
            raw_links.append(link)
            download_links.append(link)
            hdb_imdb_mapping[link] = t.summary.strip('/').split('/')[-1]
    elif 'ptp' in site:
        raw_links = []
        download_links = []
        for t in feed.entries:
            link = t.link
            raw_links.append(link)
            download_links.append(link)
            url_pattern = re.compile(r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+')
            match = url_pattern.search(t.description)

            if match:
                print("Found imdb URL:", match.group())
                ptp_imdb_mapping[link] = match.group()
            else:
                print("No imdb URL found.")
            # hdb_imdb_mapping[link] = t.summary.strip('/').split('/')[-1]
    else:
        raw_links = [item.link for item in feed.entries]
        download_links = [item.links[1].href for item in feed.entries]
    


    for j in range(0, len(raw_links)):
        rawlink = raw_links[j]
        dlink = download_links[j]
        id = rawlink.split('=')[1]

        if site == 'putao' or 'hdb' in site:
            id = id.split('&')[0]
        if 'ptp' in site:
            id = rawlink.split('id=')[1]

        if len(limit) > 0 and int(limit) >= int(id):
            print('ID检测限制，跳过！！！' + id)
            continue

        if site == 'ttg':
            dlink = 'https://totheglory.im/dl/' + id + '/' + ttg_passkey
        with open(base_path+"/history.txt", mode='a+', encoding='utf-8') as f:
            f.seek(0, os.SEEK_SET)
            downloaded = [line.strip() for line in f.readlines()]

        site_id = site + '-' + id
        if site_id not in downloaded:
            if 'hdb' in site:
                imdb_id = hdb_imdb_mapping[rawlink]
            elif 'ptp' in site:
                match = re.search(r'tt\d+', ptp_imdb_mapping[rawlink])
                if match:
                    imdb_id = match.group(0)
            else:
                imdb_id = get_imdb_id(rawlink, cookies[i])
            file_name = site_id
            if imdb_id and len(imdb_id) > 0:
                file_name = file_name + '_' + imdb_id

            print(file_name + ' downloading')

            r = requests.get(dlink, allow_redirects=True, headers=headers)
            if not os.path.exists(base_path + '/' + now_date):
                os.makedirs(base_path + '/' + now_date)
            with open(base_path + '/' + now_date + '/' +file_name + '.torrent', 'wb') as f:
                for chunk in r.iter_content(1024):
                    f.write(chunk)
            with open(base_path+'/history.txt', mode='a', encoding='utf-8') as f:
                f.write(site_id + '\n')
            print(file_name + ' adding')

            subprocess.Popen("qbittorrent-nox --save-path=/home/tobox/down/%s/%s %s/%s/%s.torrent" % (now_date, file_name, base_path, now_date, file_name), shell=True)
        else:
            print(site_id + ' pass')
    time.sleep(120)