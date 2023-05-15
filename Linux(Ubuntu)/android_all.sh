#Created by Udith Perera
#2023-05-10
clear
echo '🟠 UAT APK - Row-Uat -> Row';
rm -r /home/....flutter_build_path..../build/app/outputs
mkdir -p /home/OutputPath
mkdir -p /home/OutputPath/REL_$(date +%Y%m%d)
if(flutter build apk -t lib/main_uat.dart --flavor=uat)
then
  find /home/.....flutter_build_path...../build/app/outputs/apk/uat/release/ -name 'UAT_DOMAIN_uatRelease*.apk' -exec mv {}   /home/OutputPath/REL_$(date +%Y%m%d) \;
  echo '🟠 👉 ************ DOMAIN UAT BUILD APK ***********'
fi


echo '🟢 PROD BUNDLE - Row-Prod -> Row';
rm -r /home/....flutter_build_path..../build/app/outputs
mkdir -p /home/OutputPath
mkdir -p /home/OutputPath/REL_$(date +%Y%m%d)
if(flutter build appbundle -t lib/main_production.dart --flavor=prod)
then
find /home/.....flutter_build_path...../build/app/outputs/bundle/prodRelease/ -name 'app-prod-release*.aab' -exec mv {}   /home/OutputPath/REL_$(date +%Y%m%d) \;
#rename bindle
shopt -s globstar
for s in /home/OutputPath/REL_$(date +%Y%m%d)/LIVE_DOMAIN_prodRelease*.apk; do
    m=( "${s%/*}"/*.apk )
    #printf '%s --> %s\n' "${m[0]}" "${s%.*}.mp4"
    #mv "${m[0]}" "${s%.*}.mp4"
    mv /home/OutputPath/REL_$(date +%Y%m%d)/app-prod-release.aab "${s%.*}.aab"
    cp "${s%.*}.aab" "${s%.*}_COPY_ONE.aab"
    cp "${s%.*}.aab" "${s%.*}_COPY_TWO.aab"
done
shopt -u globstar
echo '🟢 👉 ************ DIMAIN PRODUCTION BUILD AAB ***********'
fi