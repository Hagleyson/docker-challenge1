FROM golang:1.19-alpine AS build
WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 GOOS=linux go build -o api index.go


FROM scratch
WORKDIR /app
COPY --from=build /app/api ./
EXPOSE 8000
CMD [ "./api" ]