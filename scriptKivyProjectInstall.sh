#!/usr/bin/bash
sudo pacman -S python3 python-pip cython jdk8-openjdk android-tools zip gradle unzip xsel xclip gst-plugins-good -y

#error buildozer setuptools
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --force-reinstall

rm -rf bin
rm -rf lib

archlinux-java set java-8-openjdk
python -m pip install --upgrade pip setuptools virtualenv
#python -m virtualenv ../kivy_venv
python -m virtualenv .
python -m pip install "kivy[base]" kivy_examples
git clone https://github.com/kivy/buildozer.git
cd buildozer
python setup.py install
cd ..
rm -rf buildozer 
source ./bin/activate
pip install jnius
pip install Cython
pip install kivy
pip install pyrosm
buildozer init
#mv ../whatHolidayIsToDay/* .
#rm -rf ../whatHolidayIsToDay
#touch main.py
#chmod +x main.py

#echo "import kivy
#from kivy.app import App
#from kivy.uix.button import Label
#
#class mainApp(App):
#	def build(self):
#        return Label(text=\"Hello kivy!\")
#
#
#mApp = mainApp()
#mApp.run()" > main.py

buildozer appclean
buildozer android debug

#emulation dpi your device
#KIVY_METRICS_FONTSCALE=1.6 python main.py
