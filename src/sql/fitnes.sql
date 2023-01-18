CREATE TABLE IF NOT EXISTS public.visitor
(
    id integer NOT NULL,
    full_name character varying COLLATE pg_catalog."default" NOT NULL,
    gender character varying COLLATE pg_catalog."default",
    date_birthday character varying COLLATE pg_catalog."default" NOT NULL,
    phone character varying COLLATE pg_catalog."default",
    CONSTRAINT visitor_pkey PRIMARY KEY (id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.visitor
    OWNER to postgres;




CREATE TABLE IF NOT EXISTS public.type
(
    sport_type character varying COLLATE pg_catalog."default",
    id integer NOT NULL,
    CONSTRAINT type_pkey PRIMARY KEY (id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.type
    OWNER to postgres;



CREATE TABLE IF NOT EXISTS public.trainer
(
    full_name character varying COLLATE pg_catalog."default",
    gender character varying COLLATE pg_catalog."default",
    id integer NOT NULL,
    type integer,
    CONSTRAINT trainer_pkey PRIMARY KEY (id),
    CONSTRAINT trainer_type_fkey FOREIGN KEY (type)
        REFERENCES public.type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.trainer
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS public." visits"
(
    visitor integer,
    "time" timestamp with time zone,
    trainer integer,
    CONSTRAINT " visits_trainer_fkey" FOREIGN KEY (trainer)
        REFERENCES public.trainer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT " visits_visitor_fkey" FOREIGN KEY (visitor)
        REFERENCES public.visitor (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public." visits"
    OWNER to postgres;



insert into visitor (id, full_name, gender, date_birthday, phone)
VALUES (1,'Ben Hiro','male','13.08.2002','+996700523564');

insert into visitor (id, full_name, gender, date_birthday, phone)
VALUES (2,'Johan wall','male','14.01.2002','+996707727564');

select * from visitor;

insert into type (id,sport_type)
VALUES (1,'Fitnes');

insert into type (id,sport_type)
VALUES (2,'wrestling');



insert into trainer(full_name, gender, id, type)
VALUES('Vanessa D','female',1,1) ;

insert into trainer(full_name, gender, id, type)
VALUES('Djalilov Maksat','male',2,2) ;

INSERT INTO public." visits" (visitor, time, trainer)
VALUES (1, '2023-01-18 19:41:40.264000 +00:00', 1);

INSERT INTO public." visits" (visitor, time, trainer)
VALUES (2, '2023-01-18 19:41:40.264000 +00:00', 2);

INSERT INTO public." visits" (visitor, time, trainer)
VALUES (1, '2023-01-18 19:41:40.264000 +00:00', 2);

INSERT INTO public." visits" (visitor, time, trainer)
VALUES (2, '2023-01-18 19:41:40.264000 +00:00', 1);


select * from " visits";

select trainer.full_name as Trainer,visitor.full_name as visitor ," visits".time
from " visits" join trainer  on trainer.id = " visits".trainer
               join visitor  on visitor.id = " visits".visitor
order by time desc ;