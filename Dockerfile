FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install -y python3-pip mysql-client && \
    apt-get clean

WORKDIR /app

# Copy Python source and templates
COPY app.py /app/
COPY templates/ /app/templates/
COPY requirements.txt /app/

RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python3"]
CMD ["app.py"]
