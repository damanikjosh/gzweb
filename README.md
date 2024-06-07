# Docker Image for gzweb

This Docker image is based on `gazebo:libgazebo9` and includes additional dependencies for running gzweb

## Usage

To use this Docker image, you can pull it from Docker Hub (replace `image_name` with the actual name of the Docker image):

```bash
docker pull damanikjosh/gzweb:latest
```

You can also build it locally:

```bash
docker build -t damanikjosh/gzweb:latest .
```

You can test the image with running empty gazebo world:

```bash
docker run --rm -p 8080:8080 damanikjosh/gzweb:latest bash -c "gzserver -s libgazebo_ros_headless.so --verbose & npm start"
```

In deployment, this image can be run using Docker compose along with other ROS + Gazebo simulation project.

```yaml
services:
  ros:
    ...
  gzweb:
    image: damanikjosh/gzweb:latest
    ports:
      - "8080:8080"
    volumes:
      - <models_root_path>:/gzweb/http/client/assets/<models_root_path>
    environment:
      - ROS_MASTER_URI=http://ros:11311
      - GAZEBO_MASTER_URI=http://ros:11345
```

The root path is usually the package folder of the robot description, i.e.: `turtlebot3_description`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
