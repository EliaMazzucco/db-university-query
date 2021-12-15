-- 1 Selezionare tutti gli studenti nati nel 1990 
select *
from students s 
where year (s.date_of_birth) = 1990;

-- 2 Selezionare tutti i corsi che valgono più di 10 crediti
select *
from courses c 
where c.cfu > 10;

-- 3 Selezionare tutti gli studenti che hanno più di 30 anni
select *
from students s 
where year (date_of_birth) < 1991; 

-- 4 Selezionare tutti i corsi di laurea magistrale
select *
from degrees d 
where level like '%Magistrale%';

-- 5 Da quanti dipartimenti è composta l’università?
select count(id) as num_dipartimenti
from departments d 

-- 6 Quanti sono gli insegnanti che non hanno un numero di telefono?
select count(id)
from teachers t 
where t.phone is null;

-- 7 Contare quanti iscritti ci sono stati ogni anno
select count(id) as numero_iscritti, enrolment_date  as data_iscrizzione
from students s 
group by year(enrolment_date)
order by enrolment_date;

-- 8 Calcolare la media dei voti di ogni appello d’esame
select exam_id, avg(vote)
from exam_student es 
group by exam_id;

-- 9 Contare quanti corsi di laurea ci sono per ogni dipartimento
select d2.name , count(d2.id)
from degrees d , departments d2 
where d.department_id = d2.id 
group by d2.id ;

-- 10 Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select s.name, s.surname, d.name, s.degree_id 
from students s, degrees d 
where s.degree_id = d.id
having s.degree_id like '53';

-- 11 Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select department_id, level, name
from degrees d 
where department_id = 7 and level like 'magistrale';

-- 12 Selezionare tutti i corsi in cui insegna Fulvio Amato
select t.name, t.surname, ct.course_id 
from teachers t , course_teacher ct
where t.id = 44;

-- 13 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select s.name, s.surname, d.name, dep.name
from departments dep
inner join degrees d
on dep.id = d.department_id
inner join students s 
on d.id = s.degree_id
order by s.surname, s.name asc;