--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accepted_payments; Type: TABLE; Schema: public; Owner: erik; Tablespace: 
--

CREATE TABLE accepted_payments (
    id integer NOT NULL,
    payment_method_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.accepted_payments OWNER TO erik;

--
-- Name: accepted_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: erik
--

CREATE SEQUENCE accepted_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accepted_payments_id_seq OWNER TO erik;

--
-- Name: accepted_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erik
--

ALTER SEQUENCE accepted_payments_id_seq OWNED BY accepted_payments.id;


--
-- Name: free_blocks; Type: TABLE; Schema: public; Owner: erik; Tablespace: 
--

CREATE TABLE free_blocks (
    id integer NOT NULL,
    schedule_id integer,
    start_time character varying(255),
    end_time character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    day_number integer
);


ALTER TABLE public.free_blocks OWNER TO erik;

--
-- Name: free_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: erik
--

CREATE SEQUENCE free_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.free_blocks_id_seq OWNER TO erik;

--
-- Name: free_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erik
--

ALTER SEQUENCE free_blocks_id_seq OWNED BY free_blocks.id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: erik; Tablespace: 
--

CREATE TABLE payment_methods (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.payment_methods OWNER TO erik;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: erik
--

CREATE SEQUENCE payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_methods_id_seq OWNER TO erik;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erik
--

ALTER SEQUENCE payment_methods_id_seq OWNED BY payment_methods.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: erik; Tablespace: 
--

CREATE TABLE schedules (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.schedules OWNER TO erik;

--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: erik
--

CREATE SEQUENCE schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedules_id_seq OWNER TO erik;

--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erik
--

ALTER SEQUENCE schedules_id_seq OWNED BY schedules.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: erik; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO erik;

--
-- Name: specialties; Type: TABLE; Schema: public; Owner: erik; Tablespace: 
--

CREATE TABLE specialties (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.specialties OWNER TO erik;

--
-- Name: specialties_id_seq; Type: SEQUENCE; Schema: public; Owner: erik
--

CREATE SEQUENCE specialties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialties_id_seq OWNER TO erik;

--
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erik
--

ALTER SEQUENCE specialties_id_seq OWNED BY specialties.id;


--
-- Name: user_specialties; Type: TABLE; Schema: public; Owner: erik; Tablespace: 
--

CREATE TABLE user_specialties (
    id integer NOT NULL,
    user_id integer,
    specialty_id integer,
    user_notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_specialties OWNER TO erik;

--
-- Name: user_specialties_id_seq; Type: SEQUENCE; Schema: public; Owner: erik
--

CREATE SEQUENCE user_specialties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_specialties_id_seq OWNER TO erik;

--
-- Name: user_specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erik
--

ALTER SEQUENCE user_specialties_id_seq OWNED BY user_specialties.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: erik; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    title character varying(255),
    degree character varying(255),
    address character varying(255),
    longitude numeric,
    latitude numeric,
    photo_url character varying(255),
    phone character varying(255)
);


ALTER TABLE public.users OWNER TO erik;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: erik
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO erik;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erik
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erik
--

ALTER TABLE ONLY accepted_payments ALTER COLUMN id SET DEFAULT nextval('accepted_payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erik
--

ALTER TABLE ONLY free_blocks ALTER COLUMN id SET DEFAULT nextval('free_blocks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erik
--

ALTER TABLE ONLY payment_methods ALTER COLUMN id SET DEFAULT nextval('payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erik
--

ALTER TABLE ONLY schedules ALTER COLUMN id SET DEFAULT nextval('schedules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erik
--

ALTER TABLE ONLY specialties ALTER COLUMN id SET DEFAULT nextval('specialties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erik
--

ALTER TABLE ONLY user_specialties ALTER COLUMN id SET DEFAULT nextval('user_specialties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erik
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: accepted_payments; Type: TABLE DATA; Schema: public; Owner: erik
--

COPY accepted_payments (id, payment_method_id, user_id, created_at, updated_at) FROM stdin;
1	6	1	2014-05-18 22:29:37.848192	2014-05-18 22:29:37.848192
2	4	1	2014-05-18 22:29:37.850559	2014-05-18 22:29:37.850559
3	2	1	2014-05-18 22:29:37.851951	2014-05-18 22:29:37.851951
4	3	1	2014-05-18 22:29:37.853253	2014-05-18 22:29:37.853253
5	5	2	2014-05-18 22:29:37.945392	2014-05-18 22:29:37.945392
6	2	2	2014-05-18 22:29:37.94656	2014-05-18 22:29:37.94656
7	4	2	2014-05-18 22:29:37.947499	2014-05-18 22:29:37.947499
8	1	2	2014-05-18 22:29:37.9484	2014-05-18 22:29:37.9484
9	4	3	2014-05-18 22:29:37.961061	2014-05-18 22:29:37.961061
10	2	3	2014-05-18 22:29:37.961936	2014-05-18 22:29:37.961936
11	3	3	2014-05-18 22:29:37.962751	2014-05-18 22:29:37.962751
12	5	3	2014-05-18 22:29:37.963568	2014-05-18 22:29:37.963568
13	6	4	2014-05-18 22:29:37.975206	2014-05-18 22:29:37.975206
14	3	4	2014-05-18 22:29:37.976071	2014-05-18 22:29:37.976071
15	4	4	2014-05-18 22:29:37.976887	2014-05-18 22:29:37.976887
16	5	4	2014-05-18 22:29:37.9777	2014-05-18 22:29:37.9777
17	4	5	2014-05-18 22:29:37.989471	2014-05-18 22:29:37.989471
18	6	5	2014-05-18 22:29:37.990405	2014-05-18 22:29:37.990405
19	2	5	2014-05-18 22:29:37.991227	2014-05-18 22:29:37.991227
20	3	5	2014-05-18 22:29:37.992042	2014-05-18 22:29:37.992042
21	3	6	2014-05-18 22:29:38.003866	2014-05-18 22:29:38.003866
22	1	6	2014-05-18 22:29:38.004761	2014-05-18 22:29:38.004761
23	6	6	2014-05-18 22:29:38.005568	2014-05-18 22:29:38.005568
24	5	6	2014-05-18 22:29:38.006362	2014-05-18 22:29:38.006362
25	3	7	2014-05-18 22:29:38.017787	2014-05-18 22:29:38.017787
26	5	7	2014-05-18 22:29:38.018647	2014-05-18 22:29:38.018647
27	6	7	2014-05-18 22:29:38.019509	2014-05-18 22:29:38.019509
28	1	7	2014-05-18 22:29:38.020382	2014-05-18 22:29:38.020382
29	6	8	2014-05-18 22:29:38.032541	2014-05-18 22:29:38.032541
30	5	8	2014-05-18 22:29:38.033425	2014-05-18 22:29:38.033425
31	1	8	2014-05-18 22:29:38.034249	2014-05-18 22:29:38.034249
32	2	8	2014-05-18 22:29:38.035058	2014-05-18 22:29:38.035058
33	1	9	2014-05-18 22:29:38.052511	2014-05-18 22:29:38.052511
34	2	9	2014-05-18 22:29:38.053686	2014-05-18 22:29:38.053686
35	6	9	2014-05-18 22:29:38.054677	2014-05-18 22:29:38.054677
36	4	9	2014-05-18 22:29:38.055596	2014-05-18 22:29:38.055596
37	4	10	2014-05-18 22:29:38.068907	2014-05-18 22:29:38.068907
38	1	10	2014-05-18 22:29:38.069781	2014-05-18 22:29:38.069781
39	5	10	2014-05-18 22:29:38.070581	2014-05-18 22:29:38.070581
40	2	10	2014-05-18 22:29:38.071411	2014-05-18 22:29:38.071411
41	1	11	2014-05-18 22:29:38.083067	2014-05-18 22:29:38.083067
42	6	11	2014-05-18 22:29:38.083972	2014-05-18 22:29:38.083972
43	5	11	2014-05-18 22:29:38.084843	2014-05-18 22:29:38.084843
44	3	11	2014-05-18 22:29:38.085665	2014-05-18 22:29:38.085665
45	4	12	2014-05-18 22:29:38.097105	2014-05-18 22:29:38.097105
46	3	12	2014-05-18 22:29:38.097971	2014-05-18 22:29:38.097971
47	6	12	2014-05-18 22:29:38.098776	2014-05-18 22:29:38.098776
48	5	12	2014-05-18 22:29:38.099575	2014-05-18 22:29:38.099575
49	5	13	2014-05-18 22:29:38.111102	2014-05-18 22:29:38.111102
50	1	13	2014-05-18 22:29:38.111955	2014-05-18 22:29:38.111955
51	4	13	2014-05-18 22:29:38.112756	2014-05-18 22:29:38.112756
52	3	13	2014-05-18 22:29:38.113698	2014-05-18 22:29:38.113698
\.


--
-- Name: accepted_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erik
--

SELECT pg_catalog.setval('accepted_payments_id_seq', 52, true);


--
-- Data for Name: free_blocks; Type: TABLE DATA; Schema: public; Owner: erik
--

COPY free_blocks (id, schedule_id, start_time, end_time, created_at, updated_at, day_number) FROM stdin;
1	1	8:00 am	9:00 am	2014-05-18 22:29:37.880315	2014-05-18 22:29:37.880315	1
2	2	8:00 am	9:00 am	2014-05-18 22:29:37.952677	2014-05-18 22:29:37.952677	1
3	3	8:00 am	9:00 am	2014-05-18 22:29:37.967381	2014-05-18 22:29:37.967381	1
4	4	8:00 am	9:00 am	2014-05-18 22:29:37.981579	2014-05-18 22:29:37.981579	1
5	5	8:00 am	9:00 am	2014-05-18 22:29:37.99583	2014-05-18 22:29:37.99583	1
6	6	8:00 am	9:00 am	2014-05-18 22:29:38.010075	2014-05-18 22:29:38.010075	1
7	7	8:00 am	9:00 am	2014-05-18 22:29:38.024399	2014-05-18 22:29:38.024399	1
8	8	8:00 am	9:00 am	2014-05-18 22:29:38.04104	2014-05-18 22:29:38.04104	1
9	9	8:00 am	9:00 am	2014-05-18 22:29:38.060741	2014-05-18 22:29:38.060741	1
10	10	8:00 am	9:00 am	2014-05-18 22:29:38.075406	2014-05-18 22:29:38.075406	1
11	11	8:00 am	9:00 am	2014-05-18 22:29:38.08939	2014-05-18 22:29:38.08939	1
12	12	8:00 am	9:00 am	2014-05-18 22:29:38.103091	2014-05-18 22:29:38.103091	1
13	13	8:00 am	9:00 am	2014-05-18 22:29:38.117428	2014-05-18 22:29:38.117428	1
\.


--
-- Name: free_blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erik
--

SELECT pg_catalog.setval('free_blocks_id_seq', 13, true);


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: erik
--

COPY payment_methods (id, name, created_at, updated_at) FROM stdin;
1	Aetna PPO	2014-05-18 22:29:30.756066	2014-05-18 22:29:30.756066
2	Out of Pocket	2014-05-18 22:29:30.761658	2014-05-18 22:29:30.761658
3	Blue Cross Blue Shield	2014-05-18 22:29:30.764095	2014-05-18 22:29:30.764095
4	Harvard Pilgrim	2014-05-18 22:29:30.766493	2014-05-18 22:29:30.766493
5	Health First	2014-05-18 22:29:30.768487	2014-05-18 22:29:30.768487
6	Insurer Plus	2014-05-18 22:29:30.770287	2014-05-18 22:29:30.770287
\.


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erik
--

SELECT pg_catalog.setval('payment_methods_id_seq', 6, true);


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: erik
--

COPY schedules (id, user_id, created_at, updated_at) FROM stdin;
1	1	2014-05-18 22:29:37.866819	2014-05-18 22:29:37.866819
2	2	2014-05-18 22:29:37.950168	2014-05-18 22:29:37.950168
3	3	2014-05-18 22:29:37.965179	2014-05-18 22:29:37.965179
4	4	2014-05-18 22:29:37.979406	2014-05-18 22:29:37.979406
5	5	2014-05-18 22:29:37.993614	2014-05-18 22:29:37.993614
6	6	2014-05-18 22:29:38.007928	2014-05-18 22:29:38.007928
7	7	2014-05-18 22:29:38.022014	2014-05-18 22:29:38.022014
8	8	2014-05-18 22:29:38.03705	2014-05-18 22:29:38.03705
9	9	2014-05-18 22:29:38.058064	2014-05-18 22:29:38.058064
10	10	2014-05-18 22:29:38.073296	2014-05-18 22:29:38.073296
11	11	2014-05-18 22:29:38.087287	2014-05-18 22:29:38.087287
12	12	2014-05-18 22:29:38.10107	2014-05-18 22:29:38.10107
13	13	2014-05-18 22:29:38.115354	2014-05-18 22:29:38.115354
\.


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erik
--

SELECT pg_catalog.setval('schedules_id_seq', 13, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: erik
--

COPY schema_migrations (version) FROM stdin;
20140509150300
20140509151047
20140509170404
20140511205722
20140512215218
20140512221449
20140514153711
20140514201445
20140518194040
20140518194631
20140518202520
20140518210827
20140518212116
\.


--
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: erik
--

COPY specialties (id, name, description, created_at, updated_at) FROM stdin;
1	Depression	Depression is a mental disorder characterized by a pervasive and persistent low mood that is accompanied by low self-esteem and by a loss of interest or pleasure in normally enjoyable activities.	2014-05-18 22:29:37.793504	2014-05-18 22:29:37.793504
2	Generalized Anxiety Disorder	Generalized anxiety disorder (GAD) is an anxiety disorder that is characterized by excessive, uncontrollable and often irrational worry. This excessive worry often interferes with daily functioning, as individuals suffering GAD typically anticipate disaster, and are overly concerned about everyday matters such as health issues, money, death, family problems, friendship problems, interpersonal relationship problems, or work difficulties.	2014-05-18 22:29:37.7966	2014-05-18 22:29:37.7966
3	Obsessive Compulsive Disorder	Obsessive–compulsive disorder (OCD) is an anxiety disorder characterized by intrusive thoughts that produce uneasiness, apprehension, fear, or worry; by repetitive behaviors aimed at reducing the associated anxiety; or by a combination of such obsessions and compulsions.	2014-05-18 22:29:37.808153	2014-05-18 22:29:37.808153
4	Substance Dependence	Substance dependence is a compulsive need to use psychoactive substances in order to function normally. Substance dependence encompasses both drug and alcohol dependencies.	2014-05-18 22:29:37.81195	2014-05-18 22:29:37.81195
5	Relationship Counseling	Relationship counseling is the process of counseling the parties of a relationship in an effort to recognize and to better manage or reconcile troublesome differences and repeating patterns of distress. The relationship involved may be between members of a family or a couple (see also family therapy), employees or employers in a workplace, or between a professional and a client.	2014-05-18 22:29:37.815263	2014-05-18 22:29:37.815263
6	Grief Counseling	Grief counseling is a form of psychotherapy that aims to help people cope with grief and mourning following the death of loved ones, or with major life changes that trigger feelings of grief (e.g., divorce).	2014-05-18 22:29:37.818656	2014-05-18 22:29:37.818656
7	Personality Disorders	Personality disorders are a class of mental disorders characterised by enduring maladaptive patterns of behavior, cognition and inner experience, exhibited across many contexts and deviating markedly from those accepted by the individual's culture. These patterns develop early, are inflexible and are associated with significant distress or disability.	2014-05-18 22:29:37.822189	2014-05-18 22:29:37.822189
\.


--
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erik
--

SELECT pg_catalog.setval('specialties_id_seq', 7, true);


--
-- Data for Name: user_specialties; Type: TABLE DATA; Schema: public; Owner: erik
--

COPY user_specialties (id, user_id, specialty_id, user_notes, created_at, updated_at) FROM stdin;
1	1	5	\N	2014-05-18 22:29:37.939312	2014-05-18 22:29:37.939312
2	1	6	\N	2014-05-18 22:29:37.94197	2014-05-18 22:29:37.94197
3	2	7	\N	2014-05-18 22:29:37.957947	2014-05-18 22:29:37.957947
4	2	1	\N	2014-05-18 22:29:37.958993	2014-05-18 22:29:37.958993
5	3	4	\N	2014-05-18 22:29:37.97215	2014-05-18 22:29:37.97215
6	3	5	\N	2014-05-18 22:29:37.973169	2014-05-18 22:29:37.973169
7	4	6	\N	2014-05-18 22:29:37.986453	2014-05-18 22:29:37.986453
8	4	7	\N	2014-05-18 22:29:37.987431	2014-05-18 22:29:37.987431
9	5	7	\N	2014-05-18 22:29:38.000651	2014-05-18 22:29:38.000651
10	5	1	\N	2014-05-18 22:29:38.001698	2014-05-18 22:29:38.001698
11	6	3	\N	2014-05-18 22:29:38.014764	2014-05-18 22:29:38.014764
12	6	4	\N	2014-05-18 22:29:38.015745	2014-05-18 22:29:38.015745
13	7	7	\N	2014-05-18 22:29:38.029446	2014-05-18 22:29:38.029446
14	7	4	\N	2014-05-18 22:29:38.03041	2014-05-18 22:29:38.03041
15	8	4	\N	2014-05-18 22:29:38.048569	2014-05-18 22:29:38.048569
16	8	3	\N	2014-05-18 22:29:38.049914	2014-05-18 22:29:38.049914
17	9	3	\N	2014-05-18 22:29:38.065925	2014-05-18 22:29:38.065925
18	9	7	\N	2014-05-18 22:29:38.066894	2014-05-18 22:29:38.066894
19	10	3	\N	2014-05-18 22:29:38.080052	2014-05-18 22:29:38.080052
20	10	6	\N	2014-05-18 22:29:38.081023	2014-05-18 22:29:38.081023
21	11	6	\N	2014-05-18 22:29:38.09411	2014-05-18 22:29:38.09411
22	11	5	\N	2014-05-18 22:29:38.095092	2014-05-18 22:29:38.095092
23	12	5	\N	2014-05-18 22:29:38.108048	2014-05-18 22:29:38.108048
24	12	2	\N	2014-05-18 22:29:38.109056	2014-05-18 22:29:38.109056
25	13	3	\N	2014-05-18 22:29:38.12231	2014-05-18 22:29:38.12231
26	13	7	\N	2014-05-18 22:29:38.123467	2014-05-18 22:29:38.123467
\.


--
-- Name: user_specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erik
--

SELECT pg_catalog.setval('user_specialties_id_seq', 26, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: erik
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, title, degree, address, longitude, latitude, photo_url, phone) FROM stdin;
1	petervn@att.com	$2a$10$Ycl5skCqCBCzfgEF4EScEuRY5ls9SLK6UOidB.20.wgTPEIDWRFYK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:31.543056	2014-05-18 22:29:37.884874	Dr. Peter Von Nostrand	Psychiatrist	PhD	81 West 81st Street, New York, NY 10024, USA	-73.9749212	40.7833603	female-doctor-2.jpg	126604520130475
2	boscolover@comcast.net	$2a$10$dcG.Xuwzb5lLtAHE4OxeWeQpkZUGHuSegDiG6tYcw0Cg605uTFAQK	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:32.013344	2014-05-18 22:29:37.955436	Art Vandelay	Licensed Social Worker	MSW	158 West 84th Street, New York, NY 10024, USA	-73.975537	40.785932	male-doctor.jpg	17059805189
3	kel_varnson@nyumed.edu	$2a$10$/43BqYnT.tvH9EAsQr0d3OfiLQtyGez74d75b11bj5ObXJ09rDwhq	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:32.538148	2014-05-18 22:29:37.969765	Dr. Kel Varnson	Psychotherapist	PsyD	158 West 83rd Street, New York, NY 10024, USA	-73.9756436	40.7853416	male-doctor.jpg	1620894818542136
4	drbenez@gmail.com	$2a$10$hpMCa1Nm24gMjWGSzl05EeA4USwIwsaKtBhzqQZoLrZvUoLaoQKhS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:33.025256	2014-05-18 22:29:37.984072	Dr. Paloma Benez	Behavorial Therapist	PsyD	158 West 82nd Street, New York, NY 10024, USA	-73.976101	40.78474749999999	male-doctor.jpg	149449758337849
5	darius.braun@ritchie.name	$2a$10$a2iwgBHV3bxE6Rt7lQxtwurHTIq/VpAomS32DfxruBXezbKsa4KwS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:33.561474	2014-05-18 22:29:37.998211	Dr. Natalie Weber	Psychotherapist	PhD	222 West 23rd Street, New York, NY 10011, USA	-73.9968951	40.7443716	female-doctor-1.jpg	13626214103
6	viva@vonrueden.net	$2a$10$Avpef/WJ/wpaRuCMzTNVRu1HKO4Ms6hIOIJxUDrzrPG8zM/GOUXLa	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:34.020732	2014-05-18 22:29:38.012428	Mrs. Ruby Renner	Psychotherapist	PhD	34-56 107th Street, Corona, NY 11368, USA	-73.861598	40.75458099999999	female-doctor-1.jpg	14408948827369
7	deborah@walker.net	$2a$10$0a/PmjkHVNFaJPp2ycdIKuzHcEmZHTZ9m/uX2i/xZ2AbvdebXVrVe	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:34.491886	2014-05-18 22:29:38.026897	Alf McGlynn	Psychotherapist	PhD	28 East 20th Street, New York, NY 10003, USA	-73.9889855	40.7386999	male-doctor.jpg	12585224330450
8	davion@heidenreich.name	$2a$10$o641VjG3Z7OKfGrOHKKnA.bTaBeVcIRqdkKp52pody4UoGrB8cq2W	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:34.977981	2014-05-18 22:29:38.045373	Hosea Connelly	Psychotherapist	PhD	94 Macdougal Street, New York, NY 10012, USA	-74.001256	40.728717	female-doctor-2.jpg	19304914828174
9	alva@walshweimann.name	$2a$10$84xLHsER6rP6IttESxH74uoAS9lb0ZWBFEwdiVKCc7LGfn6kyX5fS	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:35.427914	2014-05-18 22:29:38.063428	Allene Heller	Psychotherapist	PhD	172 Sullivan Street, New York, NY 10012, USA	-74.001295	40.728173	female-doctor-2.jpg	133761446018169
10	myrtie_funk@gleason.com	$2a$10$OIhmTWDKqb1./Hg034YHje/ZrrfRLO6WpODgtkfuob6LU6WMP5.V2	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:35.915598	2014-05-18 22:29:38.077746	Mr. Laura Fadel	Psychotherapist	PhD	245 East 73rd Street, New York, NY 10021, USA	-73.9582291	40.7696537	male-doctor.jpg	17354651681
11	eldora@watsica.biz	$2a$10$PtX86rLADfNIFzBY9DOkPe5XK9Yn5dC3XhwQYWiztzqwZzKLg3xQa	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:36.68578	2014-05-18 22:29:38.091714	Rebekah Dare	Psychotherapist	PhD	66 Perry Street, New York, NY 10014, USA	-74.00386739999999	40.7353016	female-doctor-1.jpg	17452721315
12	betsy@heidenreich.info	$2a$10$8r6QiLhW.gQOI59mn7aUUO/mv/Wg/3sMhmHFvDbf617pgw./qFQdG	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:37.273765	2014-05-18 22:29:38.105467	Miss Hazle Bode	Psychotherapist	PhD	136 Waverly Place, New York, NY 10014, USA	-74.0006131	40.7330213	female-doctor-2.jpg	19330674689
13	deontae@nolan.biz	$2a$10$uFdLAo4iplaV5WvT6yKtM.2w5fFNismIW1GxVZY5ZipUS8EQx4MqO	\N	\N	\N	0	\N	\N	\N	\N	2014-05-18 22:29:37.77227	2014-05-18 22:29:38.119799	Lorenza Stanton	Psychotherapist	PhD	160 Riverside Drive, New York, NY 10024, USA	-73.97892499999999	40.791293	female-doctor-1.jpg	13165373850410
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erik
--

SELECT pg_catalog.setval('users_id_seq', 13, true);


--
-- Name: accepted_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: erik; Tablespace: 
--

ALTER TABLE ONLY accepted_payments
    ADD CONSTRAINT accepted_payments_pkey PRIMARY KEY (id);


--
-- Name: free_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: erik; Tablespace: 
--

ALTER TABLE ONLY free_blocks
    ADD CONSTRAINT free_blocks_pkey PRIMARY KEY (id);


--
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: erik; Tablespace: 
--

ALTER TABLE ONLY payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: erik; Tablespace: 
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: erik; Tablespace: 
--

ALTER TABLE ONLY specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- Name: user_specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: erik; Tablespace: 
--

ALTER TABLE ONLY user_specialties
    ADD CONSTRAINT user_specialties_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: erik; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: erik; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: erik; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: erik; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: erik
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM erik;
GRANT ALL ON SCHEMA public TO erik;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

