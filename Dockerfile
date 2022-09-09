FROM python:alpine3.10 as builder

WORKDIR /App
COPY app.py /App

RUN python app.py

FROM alpine
WORKDIR /App
COPY --from=builder /App/hello.txt /App/

ENTRYPOINT [ "/bin/sh", "-c" , "cat hello.txt && tail -f /dev/null"]