Table dw.fato_professor {
  id_fato_professor bigint [unique, not null, increment]
  id_curso bigint [not null]
  id_disciplina bigint [not null]
  id_departamento bigint [not null]
  id_data_admissao bigint [not null]
  id_data_demissao bigint [not null]
  id_data_oferta_curso bigint [not null]
  id_data_oferta_disciplina bigint [not null]
  de_nome_professor varchar(150) [not null]
  dt_carga datetime2(7) [not null]
  dt_alteracao datetime2(7)

  Indexes {
    (id_fato_professor, id_curso, id_disciplina, id_departamento, id_data_admissao, id_data_demissao, id_data_oferta_curso, id_data_oferta_disciplina) [pk, unique]
  }
}

Table dw.dim_curso {
  id_curso bigint [unique, not null, increment]
  de_curso varchar(100) [not null]
  dt_carga datetime2(7) [not null]
  dt_alteracao datetime2(7)

  Indexes {
    de_curso [unique]
  }
}

Table dw.dim_disciplina {
  id_disciplina bigint [unique, not null, increment]
  de_disciplina varchar(100) [not null]
  id_pre_requisito_disciplina int [not null]
  dt_carga datetime2(7) [not null]
  dt_alteracao datetime2(7)

  Indexes {
    de_disciplina [unique]
    id_pre_requisito_disciplina [unique]
  }
}

Table dw.dim_departamento {
  id_departamento bigint [unique, not null, increment]
  de_departamento varchar(100) [not null]
  de_campus_departamento varchar(100) [not null]
  id_professor_coordenador int [not null]
  dt_carga datetime2(7) [not null]
  dt_alteracao datetime2(7)

  Indexes {
    de_departamento [unique]
    de_campus_departamento [unique]
    id_professor_coordenador [unique]
  }
}

Table dw.dim_data {
  id_data bigint [not null]
  dt_dia date
  nu_dia smallint [not null]
  de_dia_semana varchar(20) [not null]
  nu_mes smallint [not null]
  de_mes varchar(50) [not null]
  nu_ano smallint [not null]
  nu_ano_mes int [not null]
  nu_ano_trimestre int [not null]
  nu_ano_semestre int [not null]
  fl_dia_util smallint [not null]
  dt_carga datetime2(7) [not null]
  dt_alteracao datetime2(7)

  Indexes {
    id_data [pk]
  }
}

Ref: dw.fato_professor.id_curso > dw.dim_curso.id_curso

Ref: dw.fato_professor.id_disciplina > dw.dim_disciplina.id_disciplina

Ref: dw.fato_professor.id_departamento > dw.dim_departamento.id_departamento

Ref: dw.fato_professor.id_data_admissao > dw.dim_data.id_data

Ref: dw.fato_professor.id_data_demissao > dw.dim_data.id_data

Ref: dw.fato_professor.id_data_oferta_curso > dw.dim_data.id_data

Ref: dw.fato_professor.id_data_oferta_disciplina > dw.dim_data.id_data
