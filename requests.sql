-- Display upcoming training sessions that do not overlap with a given session.



SELECT *
FROM TrainingSessions
WHERE start_time > (SELECT end_time FROM TrainingSessions WHERE session_id = 'given_session_id')
   OR end_time < (SELECT start_time FROM TrainingSessions WHERE session_id = 'given_session_id');




-- Display upcoming training sessions with available seats.



SELECT *
FROM TrainingSessions
WHERE available_seats > 0
  AND start_time > NOW();



-- Display the number of registrations per training session.



SELECT session_id, COUNT(*) AS registration_count
FROM Registrations
GROUP BY session_id;



-- Display the training session history of a given learner.



SELECT *
FROM TrainingSessions
WHERE session_id IN (SELECT session_id FROM Registrations WHERE learner_id = 'given_learner_id');



-- Display the list of sessions assigned to a given trainer, sorted by start date.



SELECT *
FROM TrainingSessions
WHERE trainer_id = 'given_trainer_id'
ORDER BY start_time;



-- Display the list of learners for a given session and trainer.



SELECT Learners.*
FROM Learners
INNER JOIN Registrations ON Learners.learner_id = Registrations.learner_id
WHERE Registrations.session_id = 'given_session_id'
  AND Registrations.trainer_id = 'given_trainer_id';



-- Display the training session history of a given trainer.



SELECT *
FROM TrainingSessions
WHERE trainer_id = 'given_trainer_id';




-- Display the trainers who are available between two dates.




SELECT *
FROM Trainers
WHERE trainer_id NOT IN (
    SELECT DISTINCT trainer_id
    FROM TrainingSessions
    WHERE start_time BETWEEN 'start_date' AND 'end_date'
       OR end_time BETWEEN 'start_date' AND 'end_date'
);





-- Display all sessions of a given training.




SELECT *
FROM TrainingSessions
WHERE training_id = 'given_training_id';




-- Display the total number of sessions per training category.




SELECT Category.category_name, COUNT(*) AS session_count
FROM TrainingSessions
INNER JOIN Training ON TrainingSessions.training_id = Training.training_id
INNER JOIN Category ON Training.category_id = Category.category_id
GROUP BY Category.category_name;




-- Display the total number of registrations per training category.




SELECT Category.category_name, COUNT(*) AS registration_count
FROM Registrations
INNER JOIN TrainingSessions ON Registrations.session_id = TrainingSessions.session_id
INNER JOIN Training ON TrainingSessions.training_id = Training.training_id
INNER JOIN Category ON Training.category_id = Category.category_id
GROUP BY Category.category_name;