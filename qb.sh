#!/bin/bash
path=$1
site=`basename $path|cut -d "-" -f1`
tmp_path="/home/tobox/bdmv"
script_path="/home/tobox"
up_path="/home/tobox/up"
up_date=`basename $(dirname $path)`

movie_date=`date +%Y_%m`


if [[ "$path" =~ "openCD" ]]
then
  cp -l $path /home/tobox/rar -R
  echo "cp -l $path /home/tobox/rar -R" >> /root/qb_move.log
  cd /home/tobox/rar/$(basename $path) && source /etc/profile && rra2 && cd /home/tobox/rar
  rclone move $(basename $path) $up_path/$site/$up_date/$(basename $path)
  echo "rclone move \"$(basename $path)\" \"$up_path/$site/$up_date/$(basename $path)\"" >> /root/qb_move.log
elif [[ "$path" =~ "$site" ]]
then
    dir_bdmv=$(rclone tree -i -d $path | grep -i "BDMV")
    if [ $? == 0 ]  #BDMV原盘
    then
      cp -l "$path" "$tmp_path" -R
      echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log 
      cd $tmp_path/$(basename $path) && $script_path/bdmv2iso.sh && cd $tmp_path
      rclone move $(basename $path) $up_path/bd_iso/$up_date/$(basename $path)
      echo "rclone move \"$(basename $path)\" \"$up_path/bd_iso/$up_date/$(basename $path)\"" >> /root/qb_move.log
    else
      dir_iso=$(rclone tree -i $path | grep -i "iso$")
      if [ $? == 0 ]  #BDISO
      then
        cp -l "$path" "$tmp_path" -R
        echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log 
        rclone move "$tmp_path/$(basename $path)" "$up_path/bd_iso/$up_date/$(basename $path)"
        echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/bd_iso/$up_date/$(basename $path)\"" >> /root/qb_move.log
      else
        dir_remux=$(rclone tree -i $path | grep -i "remux")
        if [ $? == 0 ]  #Remux
        then
          cp -l "$path" "$tmp_path" -R
          echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
          rclone move "$tmp_path/$(basename $path)" "$up_path/bd_remux/$up_date/$(basename $path)" --delete-empty-src-dirs
          echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/bd_remux/$up_date/$(basename $path)\"" >> /root/qb_move.log
        else
          dir_4K=$(basename $path | grep -i "_4K")
          if [ $? == 0 ] #4K电影
          then
            dir_size=`ls -lR $path|grep ^-|grep -i -E "mkv$|mp4$|ts$"|wc -l`
            if [ "$dir_size" -eq "1" ]
            then #自动入库
              dir_web=$(rclone tree -i $path | grep -i -E "WEB|HDTV")
              if [ $? == 0 ] #web电影
              then
                cp -l "$path" "$tmp_path" -R
                /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s
                echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s" >> /home/tobox/torcp.log
              else #bdrip
                cp -l "$path" "$tmp_path" -R
                /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k_bd/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s
                echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k_bd/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s" >> /home/tobox/torcp.log
              fi
            else #移动
              cp -l "$path" "$tmp_path" -R
              echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
              rclone move "$tmp_path/$(basename $path)" "$up_path/movies/$up_date/$(basename $path)" --delete-empty-src-dirs
              echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/movies/$up_date/$(basename $path)\"" >> /root/qb_move.log             
            fi  
          else
            dir_movies=$(basename $path | grep -i "_movies") 
            if [ $? == 0 ] #电影类别
            then
              dir_sp4k=$(rclone tree -i $path | grep -i -E "2160p|4k") 
              if [ $? == 0 ] #lemon/pter/beitai RSS无法过滤4K，需要单独筛选下
              then #4k电影
                dir_size2=`ls -lR $path|grep ^-|grep -i -E "mkv$|mp4$|ts$"|wc -l`
                if [ "$dir_size2" -eq "1" ]
                then 
                  dir_web=$(rclone tree -i $path | grep -i -E "WEB|HDTV")
                  if [ $? == 0 ] #web电影
                  then
                    cp -l "$path" "$tmp_path" -R
                    /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s
                    echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s" >> /home/tobox/torcp.log
                  else  #bdrip
                    cp -l "$path" "$tmp_path" -R
                    /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s
                    echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s" >> /home/tobox/torcp.log
                  fi
                else #移动
                  cp -l "$path" "$tmp_path" -R
                  echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
                  rclone move "$tmp_path/$(basename $path)" "$up_path/movies/$up_date/$(basename $path)" --delete-empty-src-dirs
                  echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/movies/$up_date/$(basename $path)\"" >> /root/qb_move.log                  
                fi  
              else #非4K电影
                dir_size3=`ls -lR $path|grep ^-|grep -i -E "mkv$|mp4$|ts$"|wc -l`
                if [ "$dir_size3" -eq "1" ]
                then
                  dir_web=$(rclone tree -i $path | grep -i -E "WEB|HDTV")
                  if [ $? == 0 ] #web电影
                  then
                    cp -l "$path" "$tmp_path" -R
                    /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_2k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s
                    echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_2k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s" >> /home/tobox/torcp.log
                  else #bdrip_2k
                    cp -l "$path" "$tmp_path" -R
                    /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_2k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s
                    echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_2k/$movie_date --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --plex-bracket --move-run --other-dir /home/tobox/up --origin-name --movie --make-nfo --site-str $site -s" >> /home/tobox/torcp.log
                  fi  
                else #移动
                  cp -l "$path" "$tmp_path" -R
                  echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
                  rclone move "$tmp_path/$(basename $path)" "$up_path/movies/$up_date/$(basename $path)" --delete-empty-src-dirs
                  echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/movies/$up_date/$(basename $path)\"" >> /root/qb_move.log                    
                fi  
              fi  
            else 
              dir_series=$(basename $path | grep -i "_series") 
              if [ $? == 0 ] #剧集
              then #全自动刮削剧集
                cp -l "$path" "$tmp_path" -R 
                /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/series/$(basename $path) --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --emby-bracket --move-run --origin-name --tv --site-str $site -s --other-dir /home/tobox/up --genre 动画,纪录 --sep-area --make-plex-match
                echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/series/$(basename $path) --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --emby-bracket --move-run --origin-name --tv --site-str $site -s --other-dir /home/tobox/up --genre 动画,纪录 --sep-area --make-plex-match" >> /home/tobox/torcp_series.log
                cd /home/tobox/up/series/$(basename $path)/TV
                $script_path/auto_series.sh
                cd /home/tobox/up/series/$(basename $path)/TV && rclone move . /home/tobox/up/emby_series/$up_date --delete-empty-src-dirs
              else
                dir_animes=$(basename $path | grep -i "_animes") 
                if [ $? == 0 ] #动漫              
                then
                  cp -l "$path" "$tmp_path" -R 
                  /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/series/$(basename $path) --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --emby-bracket --move-run --origin-name --tv --site-str $site -s --other-dir /home/tobox/up --genre 动画,纪录 --sep-area --make-plex-match
                  echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/series/$(basename $path) --tmdb-api-key=c05ec05ed4656c983cf450297d363bb1 --emby-bracket --move-run --origin-name --tv --site-str $site -s --other-dir /home/tobox/up --genre 动画,纪录 --sep-area --make-plex-match" >> /home/tobox/torcp_series.log
                  cd /home/tobox/up/series/$(basename $path)/TV
                  $script_path/auto_series.sh
                  cd /home/tobox/up/series/$(basename $path)/TV && rclone move . /home/tobox/up/emby_animes/$up_date --delete-empty-src-dirs
                else
                  dir_ots=$(basename $path | grep -i "_ots")
                  if [ $? == 0 ] #其他类 
                  then
                    cp -l "$path" "$tmp_path" -R
                    echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
                    rclone move "$tmp_path/$(basename $path)" "$up_path/ots/$up_date/$(basename $path)" --delete-empty-src-dirs
                    echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/ots/$up_date/$(basename $path)\"" >> /root/qb_move.log                    
                  else
                    cp -l "$path" "$tmp_path" -R
                    echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
                    rclone move "$tmp_path/$(basename $path)" "$up_path/$site/$up_date/$(basename $path)" --delete-empty-src-dirs
                    echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/$site/$up_date/$(basename $path)\"" >> /root/qb_move.log
                  fi  
                fi  
              fi  
            fi  
          fi  
        fi  
      fi     
    fi
fi

fin_date=$(date "+%Y-%m-%d %H:%M:%S")
echo "$fin_date Torrent $(basename $path) has been done!" >> /root/torrent_history.txt
