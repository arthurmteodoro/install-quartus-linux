wget -q --show-progress https://dl.dries007.net/lib32-freetype2-2.5.0.1.tar.xz -O lib32-freetype2-2.5.0.1.tar.xz
tar xf lib32-freetype2-2.5.0.1.tar.xz -C ~/intelFPGA/18.0/modelsim_ase/

cd ~/intelFPGA/18.0/modelsim_ase/
sed -i 's/linux_rh60/linux/' vco
sed -i 's/dir=`dirname "$arg0"`/dir=`dirname "$arg0"`\nexport LD_LIBRARY_PATH=${dir}\/lib32/' vco # adds "export LD_LIBRARY_PATH=${dir}/lib32" after $dir is found.
cat > ~/.local/share/applications/modelsim.desktop <<EOF
[Desktop Entry]
Version=1.0
Name=ModelSim
Comment=ModelSim
Exec=$HOME/intelFPGA/18.0/modelsim_ase/bin/vsim
Icon=applications-electronics
Terminal=true
Type=Application
Categories=Development
EOF

echo "Done, enjoy!"
