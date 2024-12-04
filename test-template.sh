rm -rf ./test-dir
mkdir test-dir
rsync -av --progress ./ ./test-dir/ --exclude .git --exclude test.sh --exclude _build
cd test-dir
echo '*' >> .gitignore
sh setup-space.sh my-awesome-lib
meson setup --wipe _build -Dprefix=/usr
meson compile -C _build
