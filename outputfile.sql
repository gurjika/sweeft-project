--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	core	user
7	exercisehub	assessment
8	exercisehub	exercise
9	exercisehub	muscle
10	exercisehub	weekday
11	exercisehub	exerciseachievement
12	exercisehub	exerciseplan
13	exercisehub	muscleexercise
14	exercisehub	plan
15	exercisehub	profile
16	exercisehub	tracking
17	exercisehub	exercisecustom
18	exercisehub	completedexercise
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add assessment	7	add_assessment
26	Can change assessment	7	change_assessment
27	Can delete assessment	7	delete_assessment
28	Can view assessment	7	view_assessment
29	Can add exercise	8	add_exercise
30	Can change exercise	8	change_exercise
31	Can delete exercise	8	delete_exercise
32	Can view exercise	8	view_exercise
33	Can add muscle	9	add_muscle
34	Can change muscle	9	change_muscle
35	Can delete muscle	9	delete_muscle
36	Can view muscle	9	view_muscle
37	Can add weekday	10	add_weekday
38	Can change weekday	10	change_weekday
39	Can delete weekday	10	delete_weekday
40	Can view weekday	10	view_weekday
41	Can add exercise achievement	11	add_exerciseachievement
42	Can change exercise achievement	11	change_exerciseachievement
43	Can delete exercise achievement	11	delete_exerciseachievement
44	Can view exercise achievement	11	view_exerciseachievement
45	Can add exercise plan	12	add_exerciseplan
46	Can change exercise plan	12	change_exerciseplan
47	Can delete exercise plan	12	delete_exerciseplan
48	Can view exercise plan	12	view_exerciseplan
49	Can add muscle exercise	13	add_muscleexercise
50	Can change muscle exercise	13	change_muscleexercise
51	Can delete muscle exercise	13	delete_muscleexercise
52	Can view muscle exercise	13	view_muscleexercise
53	Can add plan	14	add_plan
54	Can change plan	14	change_plan
55	Can delete plan	14	delete_plan
56	Can view plan	14	view_plan
57	Can add profile	15	add_profile
58	Can change profile	15	change_profile
59	Can delete profile	15	delete_profile
60	Can view profile	15	view_profile
61	Can add tracking	16	add_tracking
62	Can change tracking	16	change_tracking
63	Can delete tracking	16	delete_tracking
64	Can view tracking	16	view_tracking
65	Can add exercise custom	17	add_exercisecustom
66	Can change exercise custom	17	change_exercisecustom
67	Can delete exercise custom	17	delete_exercisecustom
68	Can view exercise custom	17	view_exercisecustom
69	Can add completed exercise	18	add_completedexercise
70	Can change completed exercise	18	change_completedexercise
71	Can delete completed exercise	18	delete_completedexercise
72	Can view completed exercise	18	view_completedexercise
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$720000$P1T7iiE3w1LqMS3VSVVVe1$IXNxnXSmqctqfc/HWfC05owvaPjfQ/0EoqVmZorHFos=	\N	t	gurjika			lgurjidze@gmail.com	t	t	2024-03-10 19:13:46.987207+04
\.


--
-- Data for Name: core_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: core_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-03-10 19:06:29.583709+04
2	contenttypes	0002_remove_content_type_name	2024-03-10 19:06:29.587708+04
3	auth	0001_initial	2024-03-10 19:06:29.627735+04
4	auth	0002_alter_permission_name_max_length	2024-03-10 19:06:29.630739+04
5	auth	0003_alter_user_email_max_length	2024-03-10 19:06:29.634158+04
6	auth	0004_alter_user_username_opts	2024-03-10 19:06:29.636163+04
7	auth	0005_alter_user_last_login_null	2024-03-10 19:06:29.639159+04
8	auth	0006_require_contenttypes_0002	2024-03-10 19:06:29.640163+04
9	auth	0007_alter_validators_add_error_messages	2024-03-10 19:06:29.643165+04
10	auth	0008_alter_user_username_max_length	2024-03-10 19:06:29.646166+04
11	auth	0009_alter_user_last_name_max_length	2024-03-10 19:06:29.649167+04
12	auth	0010_alter_group_name_max_length	2024-03-10 19:06:29.655166+04
13	auth	0011_update_proxy_permissions	2024-03-10 19:06:29.658481+04
14	auth	0012_alter_user_first_name_max_length	2024-03-10 19:06:29.661996+04
15	core	0001_initial	2024-03-10 19:06:29.702485+04
16	admin	0001_initial	2024-03-10 19:06:29.719569+04
17	admin	0002_logentry_remove_auto_add	2024-03-10 19:06:29.724346+04
18	admin	0003_logentry_add_action_flag_choices	2024-03-10 19:06:29.728345+04
19	sessions	0001_initial	2024-03-10 19:06:29.740775+04
20	core	0002_alter_user_email	2024-03-10 19:16:06.780618+04
21	exercisehub	0001_initial	2024-03-13 18:44:28.839013+04
22	exercisehub	0002_exercisecustom	2024-03-13 18:44:28.863016+04
23	exercisehub	0003_alter_weekday_options_alter_exercise_start_distance_and_more	2024-03-13 18:44:28.886524+04
24	exercisehub	0004_alter_exerciseachievement_achieved_distance_and_more	2024-03-13 18:44:28.914523+04
25	exercisehub	0005_rename_muscle_exercise_muscles_and_more	2024-03-13 18:44:28.929523+04
26	exercisehub	0006_alter_exercisecustom_created_by_alter_plan_exercise_and_more	2024-03-13 18:44:28.950523+04
27	exercisehub	0007_alter_exercisecustom_created_by_and_more	2024-03-13 18:44:28.994036+04
28	exercisehub	0008_remove_plan_weekday_weekday_plan_delete_planweekday	2024-03-13 18:44:29.024037+04
29	exercisehub	0009_alter_weekday_plan	2024-03-13 18:44:29.045037+04
30	exercisehub	0010_remove_plan_user_remove_tracking_user_plan_profile_and_more	2024-03-13 18:44:29.088553+04
31	exercisehub	0011_alter_plan_profile	2024-03-13 18:44:29.095553+04
32	exercisehub	0012_remove_assessment_weight_gained_and_more	2024-03-13 18:44:29.098553+04
33	exercisehub	0013_assessment_profile	2024-03-13 18:44:29.110554+04
34	exercisehub	0014_rename_weight_profile_start_weight_and_more	2024-03-13 18:44:29.122556+04
35	exercisehub	0015_alter_profile_age_alter_profile_goal_weight_and_more	2024-03-13 18:44:29.148553+04
36	exercisehub	0016_exerciseachievement_profile_and_more	2024-03-13 18:44:29.17156+04
37	exercisehub	0017_remove_exerciseachievement_achieved_distance_and_more	2024-03-13 18:44:29.183073+04
38	exercisehub	0018_remove_exercise_start_distance	2024-03-13 18:44:29.187074+04
39	exercisehub	0019_exerciseachievement_duration	2024-03-13 18:44:29.194075+04
40	exercisehub	0020_exerciseachievement_date_added	2024-03-13 18:44:29.208077+04
41	exercisehub	0021_rename_start_reps_exercise_reps_and_more	2024-03-13 18:44:29.224076+04
42	exercisehub	0022_remove_tracking_completion_rate_and_more	2024-03-13 18:44:29.258114+04
43	exercisehub	0023_completedexercise	2024-03-13 18:44:29.275122+04
44	exercisehub	0024_profiletracking	2024-03-13 18:44:29.290632+04
45	exercisehub	0025_profile_overall_completion_rate_and_more	2024-03-13 18:44:29.298631+04
46	exercisehub	0026_alter_assessment_options_and_more	2024-03-13 18:44:29.338632+04
47	exercisehub	0027_remove_weekday_plan_plan_weekday_alter_tracking_plan	2024-03-13 18:44:29.369635+04
48	exercisehub	0028_alter_plan_unique_together	2024-03-13 18:44:29.380146+04
49	exercisehub	0029_alter_plan_unique_together_alter_plan_weekday	2024-03-13 18:44:29.398147+04
50	exercisehub	0030_alter_plan_unique_together	2024-03-13 18:44:29.410146+04
51	exercisehub	0031_alter_plan_weekday	2024-03-13 18:44:29.424149+04
52	exercisehub	0032_alter_plan_options_alter_plan_profile_and_more	2024-03-13 18:44:29.442148+04
53	exercisehub	0033_alter_exercisecustom_default_exercise	2024-03-13 18:44:29.460148+04
54	exercisehub	0034_completedexercise_completed_by	2024-03-13 18:44:29.475153+04
55	exercisehub	0035_alter_assessment_weight_and_more	2024-03-13 18:44:29.60904+04
56	exercisehub	0036_completedexercise_time_completed	2024-03-13 18:44:29.617116+04
57	exercisehub	0037_alter_completedexercise_options_and_more	2024-03-13 18:44:29.629123+04
58	exercisehub	0038_plan_plan_description_plan_recommended	2024-03-13 18:44:29.642123+04
59	exercisehub	0039_alter_plan_profile	2024-03-13 18:44:29.655123+04
60	exercisehub	0040_remove_plan_plan_description_remove_plan_recommended_and_more	2024-03-13 18:44:29.680639+04
61	exercisehub	0041_alter_plan_profile	2024-03-13 18:44:29.692639+04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: exercisehub_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_profile (id, age, start_weight, height, goal_weight, user_id, weight_now, overall_completion_rate) FROM stdin;
\.


--
-- Data for Name: exercisehub_assessment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_assessment (id, weight, weight_added, profile_id) FROM stdin;
\.


--
-- Data for Name: exercisehub_exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_exercise (id, name, description, reps, sets, duration) FROM stdin;
5	Overhead Press	Stand with feet shoulder-width apart, holding a barbell at shoulder height with a grip slightly wider than shoulder width. Press the barbell upwards until your arms are fully extended overhead. Lower the bar back to the starting position.	3	3	15
6	Pull-Up	Grip a pull-up bar with hands slightly wider than shoulder-width apart, palms facing away from you. Pull your body up until your chin is above the bar by retracting your shoulder blades and driving your elbows down. Lower yourself back down slowly and under control.	7	2	17
7	Deadlift	Stand with feet hip-width apart, a barbell in front of your shins. Hinge at your hips to grip the barbell, keeping your back flat. Drive through your heels to stand up straight, pulling the barbell up while keeping it close to your body. Return to the starting position by hinging at the hips and lowering the barbell to the ground.	4	3	12
8	Barbell Row	Stand with feet shoulder-width apart, knees slightly bent. Bend over at the waist while keeping your back straight. Hold a barbell with a grip slightly wider than shoulder-width. Pull the bar towards your lower chest, keeping your elbows close to your body. Return to the starting position.	6	3	15
9	Front Squat	Start with the barbell on your front shoulders, elbows high. Sit back and down, keeping your knees in line with your toes. Drive up through your heels to return to the starting position.	5	6	15
10	Lunges	Grab the pull-up bar with your palms facing away from you and your hands slightly wider than shoulder-width apart. Hang with your arms fully extended. Pull yourself up by pulling your elbows down to the floor until your chin passes the bar. Lower yourself back down to the starting position in a controlled manner.	4	4	10
11	Bent-over Row	Stand with your feet shoulder-width apart, holding a barbell with an overhand grip. Bend your knees slightly and lean forward by bending at the waist, keeping your back straight. Pull the bar towards your lower chest, keeping your elbows close to your body. Lower the barbell back to the starting position in a controlled motion.	5	4	10
12	Plank	Begin in the pushup position, with your forearms on the ground and your elbows aligned below your shoulders. Your arms should be parallel to the body at about shoulder-width distance. Hold this position, keeping your body in a straight line from your head to your feet.	1	3	8
13	Russian Twist	Sit on the floor with your knees bent, feet lifted slightly off the ground, and lean back at a 45-degree angle. Hold a medicine ball or dumbbell with both hands in front of you. Twist your torso to the right and touch the weight to the ground beside you, then twist to the left. This completes one rep.	10	3	15
14	Bicep Curls	Stand with your feet shoulder-width apart, holding a dumbbell in each hand at arm's length. Keep your elbows close to your torso and rotate your palms so they are facing forward. While keeping the upper arms stationary, curl the weights while contracting your biceps. Continue to raise the weights until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a brief pause as you squeeze your biceps. Then, begin to lower the dumbbells back to the starting position.	10	3	15
15	Tricep Dips	Position your hands shoulder-width apart on a secured bench or stable chair. Slide your butt off the front of the bench with your legs extended in front of you. Straighten your arms, keeping a little bend in your elbows to keep tension on your triceps and off your elbow joints. Slowly bend your elbows to lower your body toward the floor until your elbows are at about a 90-degree angle. Be sure to keep your back close to the bench. Once you reach the bottom of the movement, press down into the bench to straighten your elbows, returning to the starting position. This completes one rep.	9	3	12
16	Mountain Climbers	Start in a plank position with your arms and legs long. Keep your abs pulled in and your body straight. Swoop your right knee in towards your chest, with the toes just off the ground. Return your right leg to the starting position as you simultaneously drive your left knee towards your chest. Continue to switch legs, picking up the pace until it feels a little like running in place in a plank position.	17	3	15
17	Leg Raises	Lie flat on your back with your legs straight and together. Keep your legs straight and lift them all the way up to the ceiling until your butt comes off the floor. Slowly lower your legs back down till they're just above the floor. Hold for a moment. Raise your legs back up. Do not let your legs touch the floor.	9	3	10
18	Front Squats	Position a barbell just above your chest, resting it on the front of your shoulders. Cross your arms to hold the bar in place and keep your elbows high throughout the movement. Descend into a squat by bending your knees and sitting back with your hips. Keep your chest up and your back straight. Drive through your heels to return to the starting position.	12	3	12
19	Face Pulls	Attach a rope to the pulley of a cable station. Grasp the rope with both hands and step back, tension in the cable. Pull the rope towards your forehead, flaring your elbows out and squeezing your shoulder blades together. Slowly return to the starting position.	11	3	10
20	Leg Curls	Lie face down on a leg curl machine, positioning the pad of the lever on the back of your legs, just below the calves. Securely hook your feet under the pad. Keeping your torso flat on the bench, curl your legs up as far as possible without lifting your upper legs from the pad. Hold for a second, then slowly lower the weight back to the starting position.	11	4	15
21	Cable Flys	Stand in the middle of a cable machine, holding a handle in each hand. Start with your hands out to the sides, slightly below shoulder height, and palms facing forward. Keeping a slight bend in your elbows, bring your hands together in front of you in a wide arc. Slowly return to the starting position.	11	4	15
22	Bulgarian Split Squats	Stand about 2 feet in front of a bench or step, facing away from it. Place one foot on the bench behind you. Lower your hips until your front thigh is almost parallel to the floor, keeping your knee in line with your foot. Drive through your front heel to return to the starting position.	9	2	12
23	Dumbbell Shoulder Press	Sit or stand with a dumbbell in each hand at shoulder height. Your palms should face forward. Press the weights above your head until your arms are fully extended. Pause briefly at the top before slowly lowering the dumbbells back to the starting position.	7	5	15
24	Lat Pulldowns	Sit at a lat pulldown station and grab the bar with a wide grip, palms facing away from you. Lean back slightly and pull the bar down to your chest, drawing your shoulder blades back and down. Slowly return the bar to the starting position with your arms fully extended.	8	4	10
25	Cable Tricep Pushdown	Attach a bar to a high pulley and grab the bar with an overhand grip, hands shoulder-width apart. Stand upright with a slight forward lean, keeping your elbows close to your body. Push the bar down by extending your arms and flexing at the elbow. Pause at the bottom of the movement, then slowly return to the starting position.	6	5	12
26	Seated Leg Press	Sit down at a leg press machine and place your feet on the platform in front of you at shoulder-width apart. Lower the safety bars holding the weighted platform, and press the platform all the way up until your legs are fully extended, without locking your knees. Lower the platform by bending your knees and return to the starting position.	7	7	14
\.


--
-- Data for Name: exercisehub_completedexercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_completedexercise (id, reps, sets, duration, exercise_id, completed_by_id, time_completed) FROM stdin;
\.


--
-- Data for Name: exercisehub_exerciseachievement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_exerciseachievement (id, achieved_sets, achieved_reps, exercise_id, profile_id, duration, date_added) FROM stdin;
\.


--
-- Data for Name: exercisehub_exercisecustom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_exercisecustom (id, new_reps, new_sets, duration, created_by_id, default_exercise_id) FROM stdin;
\.


--
-- Data for Name: exercisehub_weekday; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_weekday (id, weekday) FROM stdin;
1	Monday
2	Tuesday
3	Wednesday
4	Thursday
5	Friday
6	Saturday
7	Sunday
\.


--
-- Data for Name: exercisehub_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_plan (id, profile_id, weekday_id) FROM stdin;
\.


--
-- Data for Name: exercisehub_exerciseplan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_exerciseplan (id, exercise_id, plan_id) FROM stdin;
\.


--
-- Data for Name: exercisehub_muscle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_muscle (id, muscle) FROM stdin;
1	Hamstrings
2	Glutes
3	Lower back
4	Traps
5	Chest
6	Shoulders
7	Triceps
8	Upper back
9	Latissimus dorsi
10	Biceps
11	Core
12	Quads
13	Gluteus maximus
14	Quadriceps
15	Rhomboids
16	Forearms
17	Calves
\.


--
-- Data for Name: exercisehub_muscleexercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_muscleexercise (id, exercise_id, muscle_id) FROM stdin;
1	5	12
2	5	11
3	5	2
4	5	3
5	6	9
6	6	10
7	6	4
8	7	2
9	7	1
10	7	3
11	7	4
12	8	8
13	8	9
14	8	10
15	9	12
16	9	2
17	9	11
18	9	3
19	20	1
20	19	10
21	18	13
22	18	14
23	22	1
24	22	14
25	25	16
26	26	1
27	26	13
28	26	14
29	24	9
30	24	10
31	11	16
32	11	9
33	11	15
34	11	7
35	12	11
36	12	6
37	12	3
38	13	3
39	14	16
40	15	7
41	15	6
42	16	11
43	16	6
44	16	5
45	16	9
46	17	11
47	23	7
48	21	5
\.


--
-- Data for Name: exercisehub_tracking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercisehub_tracking (id, completion_percentage, plan_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: core_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_user_groups_id_seq', 1, false);


--
-- Name: core_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_user_id_seq', 1, true);


--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 61, true);


--
-- Name: exercisehub_assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_assessment_id_seq', 1, false);


--
-- Name: exercisehub_completedexercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_completedexercise_id_seq', 1, false);


--
-- Name: exercisehub_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_exercise_id_seq', 26, true);


--
-- Name: exercisehub_exerciseachievement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_exerciseachievement_id_seq', 1, false);


--
-- Name: exercisehub_exercisecustom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_exercisecustom_id_seq', 1, false);


--
-- Name: exercisehub_exerciseplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_exerciseplan_id_seq', 1, false);


--
-- Name: exercisehub_muscle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_muscle_id_seq', 17, true);


--
-- Name: exercisehub_muscleexercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_muscleexercise_id_seq', 48, true);


--
-- Name: exercisehub_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_plan_id_seq', 1, false);


--
-- Name: exercisehub_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_profile_id_seq', 1, false);


--
-- Name: exercisehub_tracking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_tracking_id_seq', 1, false);


--
-- Name: exercisehub_weekday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercisehub_weekday_id_seq', 7, true);


--
-- PostgreSQL database dump complete
--

