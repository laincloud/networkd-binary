IMAGE_ID=$1
docker tag $IMAGE_ID registry.aliyuncs.com/laincloud/networkd-binary:0.1.17
docker push registry.aliyuncs.com/laincloud/networkd-binary:0.1.17
