# build stage
# 拉取最小体积的node环境容器（lts-alpine） 最新的latest
FROM node:alpine as build-stage

# 进入容器的app目录, 然后拷贝当前目录(根目录)的所有文件到容器的当前目录中(/app)
WORKDIR /usr/app
COPY ./ ./

#并安装cnpm (加快容器构建速度,npm比较慢)-g cnpm --registry=https://registry.npm.taobao.org
RUN npm install 

# 删除vue环境配置文件(主要想通过容器的环境变量来达到不同的环境切换,以及为了部署到阿里云的容器服务或华为云的容器服务时, 通过配置项来配置相关的环境变量, 如果不需要可自行删除以下这句代码)
RUN rm -f .env.*

ENV VUE_APP_TEST_VALUE="My First Docker nginx vue"

#在容器内build 
RUN npm run build


# production stage
# 最后通过nginx部署build出来的文件(/dist)
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /usr/app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
