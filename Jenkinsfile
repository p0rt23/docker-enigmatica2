node {
    def port           
    def container_name
    def image_tag
    def restart

    // https://www.curseforge.com/minecraft/modpacks/enigmatica2expert/files
    def image_name     = 'enigmatica2'
    def version        = '1.72b'
    def server_file    = '/opt/volumes/files/Enigmatica2ExpertServer-1.72b.zip'
    
    if (env.BRANCH_NAME == 'master') {
        image_tag      = version
        container_name = image_name
        port           = 25575
        restart        = "always"
        docker_cmd     = "run"
        detatched      = "-d"
    }
    else {
        image_tag      = "${version}-develop"
        container_name = "${image_name}-develop" 
        port           = 25576
        restart        = "no"
        docker_cmd     = "create"
        detatched      = ""
    }

    world_volume = "${container_name}"
 
    stage('Build') {
        checkout scm
        sh "cp $server_file ./server.zip"
        sh "docker build -t p0rt23/${image_name}:${image_tag} ."
    }

    stage('Deploy') {
        try {
            sh "docker stop ${container_name}"
            sh "docker rm ${container_name}"
        }
        catch (Exception e) { 
            
        }
        sh """
            docker run \
                --rm \
                --volumes-from ${container_name} \
                alpine \
                rm -rf /opt/${image_name}/config \
                    /opt/${image_name}/mods \
                    /opt/${image_name}/schematics \
                    /opt/${image_name}/scripts && \
                rm /opt/${image_name}/entrypoint.sh \
                    /opt/${image_name}/ops.js \
                    /opt/${image_name}/run-command \
                    /opt/${image_name}/server.properties \
                    /opt/${image_name}/server.zip \
                    /opt/${image_name}/settings.cfg \
                    /opt/${image_name}/whitelist.json \
                    /opt/${image_name}/eula.txt 
        """
        sh """
            docker ${docker_cmd} \
                ${detatched} \
                --restart ${restart} \
                --name ${container_name} \
                -v ${world_volume}:/opt/${image_name} \
                -p ${port}:25565 \
                p0rt23/${image_name}:${image_tag}
        """
    }
}
