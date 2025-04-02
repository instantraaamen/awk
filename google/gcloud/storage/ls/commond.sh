# This code retrieves and extracts matching lines.

gcloud storage ls -r -L gs://bucket-name/directory/* | \
awk '
  /^gs:\/\// {
    if (filepath) { print filepath, cache, update }
    filepath = $0
    cache = ""
    update = ""
    next
  }
  /Update Time:/ {
    sub(/.*Update Time:[[:space:]]*/, "", $0)
    update = $0
    next
  }
  /Cache-Control:/ {
    sub(/.*Cache-Control:[[:space:]]*/, "", $0)
    cache = $0
    next
  }
  END { if (filepath) { print filepath, cache, update } }
' > output.txt

## before awk
# gs://bucket-name/directory/file-name:
#   Creation Time:               2025-02-20T04:21:34Z
#   Update Time:                 2025-02-20T04:21:34Z
#   Storage Class Update Time:   2025-02-20T04:21:34Z
#   Storage Class:               STANDARD
#   Cache-Control:               no-store, max-age=0
#   Content-Length:              15916
#   Content-Type:                text/html
#   Hash (CRC32C):               X4Bb9QAHKUVNKDUGWJ==
#   Hash (MD5):                  JRo6JtSNFHSOy3BeSQ==
#   ETag:                        CLSnbailFNEAI=
#   Generation:                  1740066294657972
#   Metageneration:              2
#   ACL:                         []

## after awk
# gs://bucket-name/directory/file-name: 2025-02-20T04:21:31Z no-store, max-age=0


gcloud storage ls -r -L gs://bucket-name/directory/* | \
awk '
  /^gs:\/\// {
    if (filepath) { print filepath, update, cache }
    filepath = $0
    update = ""
    cache = ""
    next
  }
  /Update Time:/ {
    update = $0
    next
  }
  /Cache-Control:/ {
    cache = $0
    next
  }
  END { if (filepath) { print filepath, update, cache } }
' > output.txt

## after awk
# gs://bucket-name/directory/file-name: Update Time:                 2025-02-20T04:21:31Z Cache-Control:               no-store, max-age=0
