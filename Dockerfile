FROM python:3.8-slim-buster

WORKDIR /app

COPY . .

#COPY requirements.txt requirements.txt 

#RUN apt-get update && apt-get install -y \
 #   python-pip3

#RUN pip3 config set global.index-url https://pypi.org/simple


#RUN pip3 install 

RUN pip install -r requirements.txt

#COPY . .

#EXPOSE 5000
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0" ]
#CMD [ "flask","run" ]