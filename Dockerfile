FROM python:2.7-slim

RUN echo 'Acquire::Retires "10";' > /etc/apt/apt.conf.d/50aptgetretries

RUN mkdir /elastalert
COPY . /elastalert

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y python2.7-dev gcc git

RUN pip2 install -r /elastalert/requirements.txt

RUN cd /elastalert && \
  python setup.py install

CMD python /elastalert/elastalert/elastalert.py --config /elastalert/config.yaml
