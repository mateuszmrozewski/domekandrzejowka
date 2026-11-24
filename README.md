# domekandrzejowka.pl – static site

Plain HTML/CSS/JS, no build step, no framework, no third-party fonts or trackers.

## 1. Get the images (once)

    ./fetch-images.sh

Downloads the header, social-share image and the 24 gallery photos (+ thumbnails) from the
live WordPress site into `images/`. Do this before changing DNS. Commit the result.

## 2. Preview locally

    python3 -m http.server 8000

Open http://localhost:8000 (links are root-relative, so opening files directly won't work).

## 3. Publish

1. Create a GitHub repo and push this folder to `main`.
2. Settings → Pages → Source: *Deploy from a branch* → `main` / `/ (root)`.
3. Settings → Pages → Custom domain: `domekandrzejowka.pl` (the `CNAME` file is already here).
4. At your DNS provider, replace the current records for the apex domain with:

       A     @   185.199.108.153
       A     @   185.199.109.153
       A     @   185.199.110.153
       A     @   185.199.111.153
       AAAA  @   2606:50c0:8000::153
       AAAA  @   2606:50c0:8001::153
       AAAA  @   2606:50c0:8002::153
       AAAA  @   2606:50c0:8003::153
       CNAME www <your-github-username>.github.io

5. When the certificate is issued, tick **Enforce HTTPS**.

Keep the WordPress host running until the site resolves from GitHub, then cancel it.

## Editing

Each page is `<folder>/index.html`, so the URLs match the old WordPress permalinks
(`/o-domku/`, `/cennik/` …) and nothing needs redirecting. The nav is repeated in each file;
for a price change just edit `cennik/index.html`.
