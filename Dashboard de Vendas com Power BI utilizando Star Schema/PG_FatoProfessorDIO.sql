CREATE SCHEMA "dw";

CREATE TABLE "dw"."fato_professor" (
  "id_fato_professor" BIGINT GENERATED BY DEFAULT AS IDENTITY UNIQUE NOT NULL,
  "id_curso" bigint NOT NULL,
  "id_disciplina" bigint NOT NULL,
  "id_departamento" bigint NOT NULL,
  "id_data_admissao" bigint NOT NULL,
  "id_data_demissao" bigint NOT NULL,
  "id_data_oferta_curso" bigint NOT NULL,
  "id_data_oferta_disciplina" bigint NOT NULL,
  "de_nome_professor" varchar(150) NOT NULL,
  "dt_carga" datetime2(7) NOT NULL,
  "dt_alteracao" datetime2(7),
  PRIMARY KEY ("id_fato_professor", "id_curso", "id_disciplina", "id_departamento", "id_data_admissao", "id_data_demissao", "id_data_oferta_curso", "id_data_oferta_disciplina")
);

CREATE TABLE "dw"."dim_curso" (
  "id_curso" BIGINT GENERATED BY DEFAULT AS IDENTITY UNIQUE NOT NULL,
  "de_curso" varchar(100) NOT NULL,
  "dt_carga" datetime2(7) NOT NULL,
  "dt_alteracao" datetime2(7)
);

CREATE TABLE "dw"."dim_disciplina" (
  "id_disciplina" BIGINT GENERATED BY DEFAULT AS IDENTITY UNIQUE NOT NULL,
  "de_disciplina" varchar(100) NOT NULL,
  "id_pre_requisito_disciplina" int NOT NULL,
  "dt_carga" datetime2(7) NOT NULL,
  "dt_alteracao" datetime2(7)
);

CREATE TABLE "dw"."dim_departamento" (
  "id_departamento" BIGINT GENERATED BY DEFAULT AS IDENTITY UNIQUE NOT NULL,
  "de_departamento" varchar(100) NOT NULL,
  "de_campus_departamento" varchar(100) NOT NULL,
  "id_professor_coordenador" int NOT NULL,
  "dt_carga" datetime2(7) NOT NULL,
  "dt_alteracao" datetime2(7)
);

CREATE TABLE "dw"."dim_data" (
  "id_data" bigint NOT NULL,
  "dt_dia" date,
  "nu_dia" smallint NOT NULL,
  "de_dia_semana" varchar(20) NOT NULL,
  "nu_mes" smallint NOT NULL,
  "de_mes" varchar(50) NOT NULL,
  "nu_ano" smallint NOT NULL,
  "nu_ano_mes" int NOT NULL,
  "nu_ano_trimestre" int NOT NULL,
  "nu_ano_semestre" int NOT NULL,
  "fl_dia_util" smallint NOT NULL,
  "dt_carga" datetime2(7) NOT NULL,
  "dt_alteracao" datetime2(7),
  PRIMARY KEY ("id_data")
);

CREATE UNIQUE INDEX ON "dw"."dim_curso" ("de_curso");

CREATE UNIQUE INDEX ON "dw"."dim_disciplina" ("de_disciplina");

CREATE UNIQUE INDEX ON "dw"."dim_disciplina" ("id_pre_requisito_disciplina");

CREATE UNIQUE INDEX ON "dw"."dim_departamento" ("de_departamento");

CREATE UNIQUE INDEX ON "dw"."dim_departamento" ("de_campus_departamento");

CREATE UNIQUE INDEX ON "dw"."dim_departamento" ("id_professor_coordenador");

ALTER TABLE "dw"."fato_professor" ADD FOREIGN KEY ("id_curso") REFERENCES "dw"."dim_curso" ("id_curso");

ALTER TABLE "dw"."fato_professor" ADD FOREIGN KEY ("id_disciplina") REFERENCES "dw"."dim_disciplina" ("id_disciplina");

ALTER TABLE "dw"."fato_professor" ADD FOREIGN KEY ("id_departamento") REFERENCES "dw"."dim_departamento" ("id_departamento");

ALTER TABLE "dw"."fato_professor" ADD FOREIGN KEY ("id_data_admissao") REFERENCES "dw"."dim_data" ("id_data");

ALTER TABLE "dw"."fato_professor" ADD FOREIGN KEY ("id_data_demissao") REFERENCES "dw"."dim_data" ("id_data");

ALTER TABLE "dw"."fato_professor" ADD FOREIGN KEY ("id_data_oferta_curso") REFERENCES "dw"."dim_data" ("id_data");

ALTER TABLE "dw"."fato_professor" ADD FOREIGN KEY ("id_data_oferta_disciplina") REFERENCES "dw"."dim_data" ("id_data");
