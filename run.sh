TODAYS_DATE_TIME="`date +%Y-%m-%d-%H_%M`"  # Minute level


./run_app_adapters_uat.sh
echo ====================== Copy Build Files ======================
pwd
mkdir ../../../BuildPackages/$TODAYS_DATE_TIME
cp -a ../../../GatewayMobileApp/adapters/*/target/*.adapter ../../../BuildPackages/$TODAYS_DATE_TIME

./run_service_adapters_uat.sh
echo ====================== Copy Build Files ======================
pwd
cp -a ../../../GatewayServices/adapters/*/target/*.adapter ../../../BuildPackages/$TODAYS_DATE_TIME

cd ../../../GatewayMobileApp/apps/Gateway/
find . -type f -name "*.ts" -print0 | xargs -0 sed -i '' -e 's#https://localhost#https://uat.cp.gateway.ga.gov#g'
cd ../../../GatewayMobileApp/apps/Gateway
ng build --configuration production --output-hashing=all
cd dist
 zip -r Gateway.zip Gateway
cp -a Gateway.zip ../../../../BuildPackages/$TODAYS_DATE_TIME
