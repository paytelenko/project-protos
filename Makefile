USER_PROTO := proto/user/user.proto
TASK_PROTO := proto/task/task.proto
PROTO_FILES := $(USER_PROTO) $(TASK_PROTO)
PROTO_OUT_DIR := .

generate:
	@echo "Генерация Go кода из protobuf файлов..."
	# Генерация для User
	protoc \
	  --go_out=$(PROTO_OUT_DIR) --go_opt=paths=source_relative \
	  --go-grpc_out=$(PROTO_OUT_DIR) --go-grpc_opt=paths=source_relative \
	  $(USER_PROTO)
	# Генерация для Task
	protoc \
	  --go_out=$(PROTO_OUT_DIR) --go_opt=paths=source_relative \
	  --go-grpc_out=$(PROTO_OUT_DIR) --go-grpc_opt=paths=source_relative \
	  $(TASK_PROTO)
	@echo "Генерация protobuf завершена!"

clean:
	find . -name "*.pb.go" -delete