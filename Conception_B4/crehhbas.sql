/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  25/02/2021 15:11:17                      */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists CLASSE;

drop table if exists ETUDIANT;

drop table if exists FORMATEUR;

drop table if exists MODULE;

drop table if exists NOTES;

drop table if exists PERSONE;

drop table if exists ROLE;

/*==============================================================*/
/* Table : ADMIN                                                */
/*==============================================================*/
create table ADMIN
(
   ID_ADMIN             int not null,
   NOM                  char(15),
   EMAIL                char(25),
   PASSWORD             char(50),
   primary key (ID_ADMIN)
);

/*==============================================================*/
/* Table : CLASSE                                               */
/*==============================================================*/
create table CLASSE
(
   ID_CLASSE            int not null,
   ID_PERSON            int,
   ID_ETUDIANT          int,
   FOR_ID_PERSON        int not null,
   ID_FORMATEUR         int not null,
   NOM_CLASSE           char(10),
   primary key (ID_CLASSE)
);

/*==============================================================*/
/* Table : ETUDIANT                                             */
/*==============================================================*/
create table ETUDIANT
(
   ID_PERSON            int not null,
   ID_ETUDIANT          int not null,
   NOM                  char(15),
   PRENOM               char(20),
   AGE                  int,
   EMAIL                char(25),
   PASSWORD             char(50),
   primary key (ID_PERSON, ID_ETUDIANT)
);

/*==============================================================*/
/* Table : FORMATEUR                                            */
/*==============================================================*/
create table FORMATEUR
(
   ID_PERSON            int not null,
   ID_FORMATEUR         int not null,
   NOM                  char(15),
   PRENOM               char(20),
   AGE                  int,
   EMAIL                char(25),
   PASSWORD             char(50),
   primary key (ID_PERSON, ID_FORMATEUR)
);

/*==============================================================*/
/* Table : MODULE                                               */
/*==============================================================*/
create table MODULE
(
   ID_MODULE            int not null,
   ID_NOTE              int,
   NOM_MODULE           char(50),
   primary key (ID_MODULE)
);

/*==============================================================*/
/* Table : NOTES                                                */
/*==============================================================*/
create table NOTES
(
   ID_NOTE              int not null,
   FOR_ID_PERSON        int,
   ID_FORMATEUR         int,
   ID_PERSON            int not null,
   ID_ETUDIANT          int not null,
   NOTE                 float,
   primary key (ID_NOTE)
);

/*==============================================================*/
/* Table : PERSONE                                              */
/*==============================================================*/
create table PERSONE
(
   ID_PERSON            int not null,
   NOM                  char(15),
   PRENOM               char(20),
   AGE                  int,
   EMAIL                char(25),
   PASSWORD             char(50),
   primary key (ID_PERSON)
);

/*==============================================================*/
/* Table : ROLE                                                 */
/*==============================================================*/
create table ROLE
(
   ID_ROLE              int not null,
   ID_PERSON            int,
   FONCTION             text,
   primary key (ID_ROLE)
);

alter table CLASSE add constraint FK_CLASSE_ETUDIANT foreign key (ID_PERSON, ID_ETUDIANT)
      references ETUDIANT (ID_PERSON, ID_ETUDIANT) on delete restrict on update restrict;

alter table CLASSE add constraint FK_CLASSE_FORMATEUR2 foreign key (FOR_ID_PERSON, ID_FORMATEUR)
      references FORMATEUR (ID_PERSON, ID_FORMATEUR) on delete restrict on update restrict;

alter table ETUDIANT add constraint FK_HERITE foreign key (ID_PERSON)
      references PERSONE (ID_PERSON) on delete restrict on update restrict;

alter table FORMATEUR add constraint FK_HERITE2 foreign key (ID_PERSON)
      references PERSONE (ID_PERSON) on delete restrict on update restrict;

alter table MODULE add constraint FK_RELATION_7 foreign key (ID_NOTE)
      references NOTES (ID_NOTE) on delete restrict on update restrict;

alter table NOTES add constraint FK_AFFECTER foreign key (FOR_ID_PERSON, ID_FORMATEUR)
      references FORMATEUR (ID_PERSON, ID_FORMATEUR) on delete restrict on update restrict;

alter table NOTES add constraint FK_AFFICHER foreign key (ID_PERSON, ID_ETUDIANT)
      references ETUDIANT (ID_PERSON, ID_ETUDIANT) on delete restrict on update restrict;

alter table ROLE add constraint FK_ET foreign key (ID_PERSON)
      references PERSONE (ID_PERSON) on delete restrict on update restrict;

