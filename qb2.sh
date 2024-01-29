#!/bin/bash
path=$1
site=`basename $path|cut -d "-" -f1`
tmp_path="/home/tobox/bdmv"
script_path="/home/tobox"
up_path="/home/tobox/up"
up_date=`basename $(dirname $path)`

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
              dir_web=$(rclone tree -i $path | grep -i "WEB")
              if [ $? == 0 ] #web电影
              then
                cp -l "$path" "$tmp_path" -R
                /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s
                echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s" >> /home/tobox/torcp.log
              else #bdrip
                cp -l "$path" "$tmp_path" -R
                /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k_bd --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s
                echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k_bd --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s" >> /home/tobox/torcp.log
              fi
            else #移动
              cp -l "$path" "$tmp_path" -R
              echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
              rclone move "$tmp_path/$(basename $path)" "$up_path/$site/$up_date/$(basename $path)" --delete-empty-src-dirs
              echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/$site/$up_date/$(basename $path)\"" >> /root/qb_move.log             
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
                  dir_web=$(rclone tree -i $path | grep -i "WEB")
                  if [ $? == 0 ] #web电影
                  then
                    cp -l "$path" "$tmp_path" -R
                    /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s
                    echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s" >> /home/tobox/torcp.log
                  else  #bdrip
                    cp -l "$path" "$tmp_path" -R
                    /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k_bd --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s
                    echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_4k_bd --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s" >> /home/tobox/torcp.log
                  fi
                else #移动
                  cp -l "$path" "$tmp_path" -R
                  echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
                  rclone move "$tmp_path/$(basename $path)" "$up_path/$site/$up_date/$(basename $path)" --delete-empty-src-dirs
                  echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/$site/$up_date/$(basename $path)\"" >> /root/qb_move.log                  
                fi  
              else #非4K电影
                dir_size3=`ls -lR $path|grep ^-|grep -i -E "mkv$|mp4$|ts$"|wc -l`
                if [ "$dir_size3" -eq "1" ]
                then
                  dir_web=$(rclone tree -i $path | grep -i "WEB")
                  if [ $? == 0 ] #web电影
                  then
                    cp -l "$path" "$tmp_path" -R
                    /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_2k --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s
                    echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_2k --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s" >> /home/tobox/torcp.log
                  else #bdrip_2k
                    cp -l "$path" "$tmp_path" -R
                    /usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_2k_bd --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s
                    echo "/usr/bin/python3 /home/tobox/torcp/tp.py $tmp_path/$(basename $path) -d /home/tobox/up/emby_movies_2k_bd --tmdb-api-key=318280687b11ff25b345451a53681a71 --emby-bracket --move-run --origin-name --movie --site-str $site -s" >> /home/tobox/torcp.log
                  fi  
                else #移动
                  cp -l "$path" "$tmp_path" -R
                  echo "cp -l \"$path\" \"$tmp_path\" -R" >> /root/qb_move.log
                  rclone move "$tmp_path/$(basename $path)" "$up_path/$site/$up_date/$(basename $path)" --delete-empty-src-dirs
                  echo "rclone move \"$tmp_path/$(basename $path)\" \"$up_path/$site/$up_date/$(basename $path)\"" >> /root/qb_move.log                    
                fi  
              fi  
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

fin_date=$(date "+%Y-%m-%d %H:%M:%S")
echo "$fin_date Torrent $(basename $path) has been done!" >> /root/torrent_history.txt
