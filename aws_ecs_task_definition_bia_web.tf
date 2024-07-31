resource "aws_ecs_task_definition" "bia-web" {
  family        = "task-def-bia"
  network_mode  = "bridge"
  task_role_arn = aws_iam_role.ecs_task_role.arn // Para ter a permissão atachada no momento que lançar o Service

  container_definitions = jsonencode([{
    name              = "bia",
    image             = "${aws_ecr_repository.bia.repository_url}:latest", // Imagem do ECR
    essential         = true                                               // Container essencial
    portMappings      = [{ containerPort = 8080, hostPort = 80 }],         // Mapeamento de porta
    cpu               = 1024                                               // 1 VCPU
    memoryReservation = 400                                                // Soft Limit 400MB
    environment = [
      { name = "DB_PORT", value = "5432" },                                                 // Porta do postgree ?
      { name = "DB_HOST", value = "${aws_db_instance.bia.address}" },                       // Endereço do Banco
      { name = "DB_SECRET_NAME", value = "${data.aws_secretsmanager_secret.bia_db.name}" }, // Nome do segredo
      { name = "DB_REGION", value = "us-east-1" },                                          // Região da virginia
      { name = "DEBUG_SECRET", value = "true" },                                            // True para mostrar a senha. Padrão FALSE
    ]
    logConfiguration = {
      logDriver = "awslogs",
      options = {
        "awslogs-region"        = "us-east-1",
        "awslogs-group"         = aws_cloudwatch_log_group.ecs_bia_web.name, // Endereço do log no Cloud Watch
        "awslogs-stream-prefix" = "bia"
      }
    },
  }])

  runtime_platform {
    cpu_architecture        = "X86_64" // Inserir arquitetura de CPU das intâncias
    operating_system_family = "LINUX"
  }

}
