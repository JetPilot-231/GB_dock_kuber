FROM alpine:3.18

WORkDIR /app

RUN apk update && apk add --no-cache python3 python3-dev py3-pip

ADD ./python /app

RUN pip3 install -r requirements.txt

RUN apk add --no-cache go git

COPY ./golang/. .

RUN go mod download

RUN go build -o main .

CMD python3 app.py && ./main
