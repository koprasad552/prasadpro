cd ../../../GatewayMobileApp
find . -type f -name "pom.xml" -print0 | xargs -0 sed -i '' -e 's#<mfpfUrl>http://localhost:9080/mfpadmin%3C/mfpfUrl%3E#%3CmfpfUrl%3Ehttp://10.195.140.220:9080//mfpadmin%3C/mfpfUrl%3E#g'
find . -type f -name "*.java" -print0 | xargs -0 sed -i '' -e 's#http://localhost:9080#http://10.195.140.175:9080#g'

echo ======================Generate Gateway Lib Jar file======================
(cd ../GatewayLib;mvn clean:clean)
(cd ../GatewayLib;mvn clean install)
(cd ../GatewayLib;mvn package)

echo ====================== Building Gateway Adapters ======================
mvn clean
mvn install
mvn adapter:deploy
echo ====================== Building Gateway Adapters Complete ======================
