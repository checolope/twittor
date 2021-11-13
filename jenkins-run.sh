container_name=jenkins-demo
image_name=jenkins-demo
server_port=9524
data_dir="/home/1/data/"
if [ -f "target/demo-0.0.1-SNAPSHOT.jar" ]; then
        container_id=$(docker ps -a | grep "${container_name}" | awk '{print $1}')
        if [ "${container_id}" != "" ];then
            docker stop ${container_name}
            docker rm ${container_name}
            docker rmi  ${image_name}
        fi
          docker build -t ${image_name} .
          docker run -d -p ${server_port}:8080 \
          -e TZ="Asia/Shanghai" \
          -v /etc/localtime:/etc/localtime \
          -v ${data_dir}/db:/data \
          -v ${data_dir}/upload:/upload \
          --name ${container_name} ${image_name}
    else
        echo "build error!"
        exit -1
fi