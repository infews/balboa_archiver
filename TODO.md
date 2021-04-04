# To Do

- Copier
  - `#copy` just copy src to dst
- Mover
  - `#move` moves file from src to dst
    
http://gaidi.ca/weblog/creating-a-hash-checksum-for-an-external-file-in

if dst.exist?
    if files_are_not_the_same(src, dst)
        COPY
else
    skip
end



- COPY if dst does not exist in destination
- COPY if src.date > dst.date
- COPY if src.size != dst.size
- COPY if hash(src) != hash(dst)
