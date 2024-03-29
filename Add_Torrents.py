import requests
import os
import time

def download_torrent(url, save_path):
    response = requests.get(url)
    with open(save_path, 'wb') as file:
        file.write(response.content)
    time.sleep(2)  # Wait for 2 seconds between downloads

def add_tag_to_torrent(torrent_path, tag):
    save_path = tag
    os.system(f'qbittorrent-nox --save-path={save_path} {torrent_path}')

def extract_id_from_url(url):
    id_string = url.split('id=')[1].split('&')[0]
    return id_string

def process_links(links_file):
    with open(links_file, 'r') as file:
        for line in file:
            url = line.strip()
            id_string = extract_id_from_url(url)
            torrent_file = f"{id_string}.torrent"
            download_path = f"/home/boxbox/qbittorrent/download/Audies_{id_string}/"
            download_torrent(url, torrent_file)
            add_tag_to_torrent(torrent_file, download_path)

# 替换为您的链接文件路径
links_file_path = '/home/boxbox/links.txt'
process_links(links_file_path)
