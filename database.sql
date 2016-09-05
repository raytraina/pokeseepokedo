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
-- Name: encounters; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE encounters (
    encounter_id integer NOT NULL,
    latitude double precision,
    pokemon_id integer,
    longitude double precision
);


ALTER TABLE public.encounters OWNER TO vagrant;

--
-- Name: encounters_encounter_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE encounters_encounter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encounters_encounter_id_seq OWNER TO vagrant;

--
-- Name: encounters_encounter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE encounters_encounter_id_seq OWNED BY encounters.encounter_id;


--
-- Name: gyms; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE gyms (
    gym_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    name character varying(100) NOT NULL
);


ALTER TABLE public.gyms OWNER TO vagrant;

--
-- Name: gyms_gym_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE gyms_gym_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gyms_gym_id_seq OWNER TO vagrant;

--
-- Name: gyms_gym_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE gyms_gym_id_seq OWNED BY gyms.gym_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE locations (
    location_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    rating integer,
    name character varying(100) NOT NULL,
    url character varying(200),
    category character varying(50)
);


ALTER TABLE public.locations OWNER TO vagrant;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE locations_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_location_id_seq OWNER TO vagrant;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE locations_location_id_seq OWNED BY locations.location_id;


--
-- Name: poke_base; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE poke_base (
    pokemon_id integer NOT NULL,
    identifier character varying(60) NOT NULL,
    height integer NOT NULL,
    weight integer NOT NULL,
    nature character varying(60) NOT NULL
);


ALTER TABLE public.poke_base OWNER TO vagrant;

--
-- Name: poke_base_pokemon_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE poke_base_pokemon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poke_base_pokemon_id_seq OWNER TO vagrant;

--
-- Name: poke_base_pokemon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE poke_base_pokemon_id_seq OWNED BY poke_base.pokemon_id;


--
-- Name: poketypes; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE poketypes (
    poketype_id integer NOT NULL,
    pokemon_id integer,
    type_id integer
);


ALTER TABLE public.poketypes OWNER TO vagrant;

--
-- Name: poketypes_poketype_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE poketypes_poketype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poketypes_poketype_id_seq OWNER TO vagrant;

--
-- Name: poketypes_poketype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE poketypes_poketype_id_seq OWNED BY poketypes.poketype_id;


--
-- Name: type_base; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE type_base (
    type_id integer NOT NULL,
    identifier character varying(60) NOT NULL
);


ALTER TABLE public.type_base OWNER TO vagrant;

--
-- Name: type_base_type_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE type_base_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_base_type_id_seq OWNER TO vagrant;

--
-- Name: type_base_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE type_base_type_id_seq OWNED BY type_base.type_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    username character varying(64),
    email character varying(64),
    password character varying(64),
    first_name character varying(64),
    last_name character varying(64),
    user_since timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: encounter_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY encounters ALTER COLUMN encounter_id SET DEFAULT nextval('encounters_encounter_id_seq'::regclass);


--
-- Name: gym_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY gyms ALTER COLUMN gym_id SET DEFAULT nextval('gyms_gym_id_seq'::regclass);


--
-- Name: location_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY locations ALTER COLUMN location_id SET DEFAULT nextval('locations_location_id_seq'::regclass);


--
-- Name: pokemon_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY poke_base ALTER COLUMN pokemon_id SET DEFAULT nextval('poke_base_pokemon_id_seq'::regclass);


--
-- Name: poketype_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY poketypes ALTER COLUMN poketype_id SET DEFAULT nextval('poketypes_poketype_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY type_base ALTER COLUMN type_id SET DEFAULT nextval('type_base_type_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: encounters; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY encounters (encounter_id, latitude, pokemon_id, longitude) FROM stdin;
1	37.7849879999999985	13	-122.400979000000007
2	37.7841149999999999	19	-122.400426999999993
3	37.78416	41	-122.398883999999995
4	37.7828599999999994	133	-122.397441999999998
5	37.7816910000000021	48	-122.395854999999997
6	37.7809230000000014	54	-122.396632999999994
7	37.7791179999999969	10	-122.393389999999997
8	37.7781939999999992	39	-122.393469999999994
9	37.7774500000000018	16	-122.391695999999996
10	37.7788520000000005	147	-122.389962999999995
\.


--
-- Name: encounters_encounter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('encounters_encounter_id_seq', 1, false);


--
-- Data for Name: gyms; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY gyms (gym_id, latitude, longitude, name) FROM stdin;
1	37.7848382000000029	-122.402670000000001	Yerba Buena Gardens Gym
\.


--
-- Name: gyms_gym_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('gyms_gym_id_seq', 1, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY locations (location_id, latitude, longitude, rating, name, url, category) FROM stdin;
1	37.7796554565429972	-122.395233154297003	4	Brickhouse Cafe	https://www.yelp.com/biz/brickhouse-cafe-san-francisco-2	American (Traditional)
2	37.7805747985839986	-122.396392822265994	4	Lava Lounge	https://www.yelp.com/biz/lava-lounge-san-francisco	Lounges
3	37.7798249454072987	-122.394355908036005	5	Local Tap	https://www.yelp.com/biz/local-tap-san-francisco	Sports Bars
4	37.7781856000000005	-122.392186899999999	3	Lucky Strike	https://www.yelp.com/biz/lucky-strike-san-francisco	Bowling
5	37.7798420000000021	-122.390213000000003	3	MoMo's	https://www.yelp.com/biz/momos-san-francisco	American (New)
6	37.7841774486315032	-122.402068620684005	4	Samovar Tea Lounge	https://www.yelp.com/biz/samovar-tea-lounge-san-francisco-2	Tea Rooms
7	37.7788279999999972	-122.394065999999995	4	Victory Hall & Parlor	https://www.yelp.com/biz/victory-hall-and-parlor-san-francisco	Comfort Food
8	37.7840836132872013	-122.398313338009999	5	Wine Down SF	https://www.yelp.com/biz/wine-down-sf-san-francisco	Wine Bars
\.


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('locations_location_id_seq', 8, true);


--
-- Data for Name: poke_base; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY poke_base (pokemon_id, identifier, height, weight, nature) FROM stdin;
1	bulbasaur	7	69	lonely
2	ivysaur	10	130	hardy
3	venusaur	20	1000	lonely
4	charmander	6	85	docile
5	charmeleon	11	190	modest
6	charizard	17	905	quirky
7	squirtle	5	90	relaxed
8	wartortle	10	225	hasty
9	blastoise	16	855	adamant
10	caterpie	3	29	lonely
11	metapod	7	99	relaxed
12	butterfree	11	320	sassy
13	weedle	3	32	bold
14	kakuna	6	100	adamant
15	beedrill	10	295	relaxed
16	pidgey	3	18	sassy
17	pidgeotto	11	300	sassy
18	pidgeot	15	395	sassy
19	rattata	3	35	modest
20	raticate	7	185	calm
21	spearow	3	20	bashful
22	fearow	12	380	lonely
23	ekans	20	69	docile
24	arbok	35	650	lonely
25	pikachu	4	60	relaxed
26	raichu	8	300	jolly
27	sandshrew	6	120	relaxed
28	sandslash	10	295	modest
29	nidoran-f	4	70	adamant
30	nidorina	8	200	hardy
31	nidoqueen	13	600	bashful
32	nidoran-m	5	90	hasty
33	nidorino	9	195	hardy
34	nidoking	14	620	calm
35	clefairy	6	75	serious
36	clefable	13	400	modest
37	vulpix	6	99	bold
38	ninetales	11	199	adamant
39	jigglypuff	5	55	hasty
40	wigglytuff	10	120	relaxed
41	zubat	8	75	serious
42	golbat	16	550	adamant
43	oddish	5	54	hasty
44	gloom	8	86	serious
45	vileplume	12	186	docile
46	paras	3	54	bold
47	parasect	10	295	sassy
48	venonat	10	300	jolly
49	venomoth	15	125	hardy
50	diglett	2	8	bashful
51	dugtrio	7	333	serious
52	meowth	4	42	modest
53	persian	10	320	calm
54	psyduck	8	196	calm
55	golduck	17	766	docile
56	mankey	5	280	adamant
57	primeape	10	320	mild
58	growlithe	7	190	modest
59	arcanine	19	1550	jolly
60	poliwag	6	124	serious
61	poliwhirl	10	200	docile
62	poliwrath	13	540	bold
63	abra	9	195	mild
64	kadabra	13	565	bold
65	alakazam	15	480	modest
66	machop	8	195	sassy
67	machoke	15	705	jolly
68	machamp	16	1300	mild
69	bellsprout	7	40	mild
70	weepinbell	10	64	bashful
71	victreebel	17	155	jolly
72	tentacool	9	455	docile
73	tentacruel	16	550	quirky
74	geodude	4	200	hardy
75	graveler	10	1050	bold
76	golem	14	3000	hasty
77	ponyta	10	300	calm
78	rapidash	17	950	sassy
79	slowpoke	12	360	adamant
80	slowbro	16	785	calm
81	magnemite	3	60	lonely
82	magneton	10	600	bold
83	farfetchd	8	150	serious
84	doduo	14	392	lonely
85	dodrio	18	852	hasty
86	seel	11	900	mild
87	dewgong	17	1200	bold
88	grimer	9	300	modest
89	muk	12	300	jolly
90	shellder	3	40	adamant
91	cloyster	15	1325	relaxed
92	gastly	13	1	sassy
93	haunter	16	1	relaxed
94	gengar	15	405	lonely
95	onix	88	2100	quirky
96	drowzee	10	324	bold
97	hypno	16	756	relaxed
98	krabby	4	65	serious
99	kingler	13	600	calm
100	voltorb	5	104	bashful
101	electrode	12	666	bold
102	exeggcute	4	25	bashful
103	exeggutor	20	1200	hasty
104	cubone	4	65	modest
105	marowak	10	450	calm
106	hitmonlee	15	498	quirky
107	hitmonchan	14	502	lonely
108	lickitung	12	655	relaxed
109	koffing	6	10	adamant
110	weezing	12	95	hardy
111	rhyhorn	10	1150	jolly
112	rhydon	19	1200	mild
113	chansey	11	346	hasty
114	tangela	10	350	bashful
115	kangaskhan	22	800	sassy
116	horsea	4	80	sassy
117	seadra	12	250	calm
118	goldeen	6	150	hasty
119	seaking	13	390	lonely
120	staryu	8	345	docile
121	starmie	11	800	relaxed
122	mr-mime	13	545	hasty
123	scyther	15	560	lonely
124	jynx	14	406	docile
125	electabuzz	11	300	modest
126	magmar	13	445	adamant
127	pinsir	15	550	mild
128	tauros	14	884	hardy
129	magikarp	9	100	adamant
130	gyarados	65	2350	hardy
131	lapras	25	2200	lonely
132	ditto	3	40	modest
133	eevee	3	65	adamant
134	vaporeon	10	290	lonely
135	jolteon	8	245	modest
136	flareon	9	250	jolly
137	porygon	8	365	bold
138	omanyte	4	75	serious
139	omastar	10	350	lonely
140	kabuto	5	115	calm
141	kabutops	13	405	hardy
142	aerodactyl	18	590	relaxed
143	snorlax	21	4600	quirky
144	articuno	17	554	modest
145	zapdos	16	526	relaxed
146	moltres	20	600	hasty
147	dratini	18	33	hardy
148	dragonair	40	165	lonely
149	dragonite	22	2100	lonely
150	mewtwo	20	1220	sassy
151	mew	4	40	calm
152	chikorita	9	64	hasty
153	bayleef	12	158	bashful
154	meganium	18	1005	bashful
155	cyndaquil	5	79	modest
156	quilava	9	190	serious
157	typhlosion	17	795	adamant
158	totodile	6	95	mild
159	croconaw	11	250	hasty
160	feraligatr	23	888	modest
161	sentret	8	60	serious
162	furret	18	325	relaxed
163	hoothoot	7	212	bold
164	noctowl	16	408	jolly
165	ledyba	10	108	sassy
166	ledian	14	356	mild
167	spinarak	5	85	calm
168	ariados	11	335	hasty
169	crobat	18	750	bold
170	chinchou	5	120	relaxed
171	lanturn	12	225	quirky
172	pichu	3	20	adamant
173	cleffa	3	30	calm
174	igglybuff	3	10	serious
175	togepi	3	15	serious
176	togetic	6	32	calm
177	natu	2	20	bashful
178	xatu	15	150	adamant
179	mareep	6	78	modest
180	flaaffy	8	133	serious
181	ampharos	14	615	docile
182	bellossom	4	58	modest
183	marill	4	85	bold
184	azumarill	8	285	jolly
185	sudowoodo	12	380	hasty
186	politoed	11	339	docile
187	hoppip	4	5	bashful
188	skiploom	6	10	hasty
189	jumpluff	8	30	bashful
190	aipom	8	115	sassy
191	sunkern	3	18	jolly
192	sunflora	8	85	jolly
193	yanma	12	380	adamant
194	wooper	4	85	relaxed
195	quagsire	14	750	mild
196	espeon	9	265	adamant
197	umbreon	10	270	calm
198	murkrow	5	21	adamant
199	slowking	20	795	bold
200	misdreavus	7	10	bold
201	unown	5	50	quirky
202	wobbuffet	13	285	bold
203	girafarig	15	415	jolly
204	pineco	6	72	lonely
205	forretress	12	1258	serious
206	dunsparce	15	140	serious
207	gligar	11	648	relaxed
208	steelix	92	4000	bold
209	snubbull	6	78	hardy
210	granbull	14	487	calm
211	qwilfish	5	39	lonely
212	scizor	18	1180	jolly
213	shuckle	6	205	docile
214	heracross	15	540	hardy
215	sneasel	9	280	quirky
216	teddiursa	6	88	hasty
217	ursaring	18	1258	docile
218	slugma	7	350	lonely
219	magcargo	8	550	sassy
220	swinub	4	65	jolly
221	piloswine	11	558	hasty
222	corsola	6	50	calm
223	remoraid	6	120	serious
224	octillery	9	285	calm
225	delibird	9	160	quirky
226	mantine	21	2200	bashful
227	skarmory	17	505	bold
228	houndour	6	108	lonely
229	houndoom	14	350	mild
230	kingdra	18	1520	lonely
231	phanpy	5	335	hardy
232	donphan	11	1200	calm
233	porygon2	6	325	mild
234	stantler	14	712	lonely
235	smeargle	12	580	bashful
236	tyrogue	7	210	quirky
237	hitmontop	14	480	jolly
238	smoochum	4	60	relaxed
239	elekid	6	235	mild
240	magby	7	214	hasty
241	miltank	12	755	serious
242	blissey	15	468	hardy
243	raikou	19	1780	serious
244	entei	21	1980	adamant
245	suicune	20	1870	jolly
246	larvitar	6	720	lonely
247	pupitar	12	1520	calm
248	tyranitar	20	2020	modest
249	lugia	52	2160	bashful
250	ho-oh	38	1990	bashful
251	celebi	6	50	mild
252	treecko	5	50	lonely
253	grovyle	9	216	docile
254	sceptile	17	522	sassy
255	torchic	4	25	mild
256	combusken	9	195	mild
257	blaziken	19	520	calm
258	mudkip	4	76	quirky
259	marshtomp	7	280	bold
260	swampert	15	819	calm
261	poochyena	5	136	modest
262	mightyena	10	370	bold
263	zigzagoon	4	175	modest
264	linoone	5	325	bold
265	wurmple	3	36	modest
266	silcoon	6	100	lonely
267	beautifly	10	284	hasty
268	cascoon	7	115	modest
269	dustox	12	316	hardy
270	lotad	5	26	bashful
271	lombre	12	325	lonely
272	ludicolo	15	550	quirky
273	seedot	5	40	serious
274	nuzleaf	10	280	hasty
275	shiftry	13	596	quirky
276	taillow	3	23	bashful
277	swellow	7	198	relaxed
278	wingull	6	95	adamant
279	pelipper	12	280	docile
280	ralts	4	66	hardy
281	kirlia	8	202	mild
282	gardevoir	16	484	relaxed
283	surskit	5	17	relaxed
284	masquerain	8	36	serious
285	shroomish	4	45	quirky
286	breloom	12	392	jolly
287	slakoth	8	240	jolly
288	vigoroth	14	465	hasty
289	slaking	20	1305	bashful
290	nincada	5	55	sassy
291	ninjask	8	120	docile
292	shedinja	8	12	hardy
293	whismur	6	163	relaxed
294	loudred	10	405	serious
295	exploud	15	840	calm
296	makuhita	10	864	hardy
297	hariyama	23	2538	mild
298	azurill	2	20	jolly
299	nosepass	10	970	lonely
300	skitty	6	110	docile
301	delcatty	11	326	bold
302	sableye	5	110	bashful
303	mawile	6	115	hardy
304	aron	4	600	bold
305	lairon	9	1200	modest
306	aggron	21	3600	quirky
307	meditite	6	112	bold
308	medicham	13	315	hardy
309	electrike	6	152	hasty
310	manectric	15	402	lonely
311	plusle	4	42	sassy
312	minun	4	42	relaxed
313	volbeat	7	177	sassy
314	illumise	6	177	sassy
315	roselia	3	20	docile
316	gulpin	4	103	adamant
317	swalot	17	800	calm
318	carvanha	8	208	bashful
319	sharpedo	18	888	modest
320	wailmer	20	1300	docile
321	wailord	145	3980	modest
322	numel	7	240	quirky
323	camerupt	19	2200	quirky
324	torkoal	5	804	modest
325	spoink	7	306	jolly
326	grumpig	9	715	docile
327	spinda	11	50	bashful
328	trapinch	7	150	quirky
329	vibrava	11	153	hasty
330	flygon	20	820	adamant
331	cacnea	4	513	bold
332	cacturne	13	774	mild
333	swablu	4	12	bold
334	altaria	11	206	bold
335	zangoose	13	403	mild
336	seviper	27	525	lonely
337	lunatone	10	1680	bold
338	solrock	12	1540	lonely
339	barboach	4	19	calm
340	whiscash	9	236	hasty
341	corphish	6	115	sassy
342	crawdaunt	11	328	sassy
343	baltoy	5	215	adamant
344	claydol	15	1080	calm
345	lileep	10	238	docile
346	cradily	15	604	calm
347	anorith	7	125	serious
348	armaldo	15	682	mild
349	feebas	6	74	lonely
350	milotic	62	1620	mild
351	castform	3	8	bashful
352	kecleon	10	220	hasty
353	shuppet	6	23	calm
354	banette	11	125	sassy
355	duskull	8	150	quirky
356	dusclops	16	306	jolly
357	tropius	20	1000	sassy
358	chimecho	6	10	docile
359	absol	12	470	relaxed
360	wynaut	6	140	adamant
361	snorunt	7	168	bold
362	glalie	15	2565	modest
363	spheal	8	395	quirky
364	sealeo	11	876	bold
365	walrein	14	1506	calm
366	clamperl	4	525	serious
367	huntail	17	270	jolly
368	gorebyss	18	226	docile
369	relicanth	10	234	calm
370	luvdisc	6	87	quirky
371	bagon	6	421	lonely
372	shelgon	11	1105	mild
373	salamence	15	1026	hasty
374	beldum	6	952	modest
375	metang	12	2025	sassy
376	metagross	16	5500	quirky
377	regirock	17	2300	docile
378	regice	18	1750	hardy
379	registeel	19	2050	quirky
380	latias	14	400	docile
381	latios	20	600	adamant
382	kyogre	45	3520	calm
383	groudon	35	9500	lonely
384	rayquaza	70	2065	hardy
385	jirachi	3	11	quirky
386	deoxys-normal	17	608	adamant
387	turtwig	4	102	relaxed
388	grotle	11	970	bold
389	torterra	22	3100	mild
390	chimchar	5	62	lonely
391	monferno	9	220	adamant
392	infernape	12	550	modest
393	piplup	4	52	adamant
394	prinplup	8	230	bold
395	empoleon	17	845	hardy
396	starly	3	20	jolly
397	staravia	6	155	quirky
398	staraptor	12	249	hardy
399	bidoof	5	200	jolly
400	bibarel	10	315	bashful
401	kricketot	3	22	calm
402	kricketune	10	255	bold
403	shinx	5	95	lonely
404	luxio	9	305	mild
405	luxray	14	420	hasty
406	budew	2	12	jolly
407	roserade	9	145	hardy
408	cranidos	9	315	sassy
409	rampardos	16	1025	hasty
410	shieldon	5	570	serious
411	bastiodon	13	1495	serious
412	burmy	2	34	adamant
413	wormadam-plant	5	65	docile
414	mothim	9	233	bashful
415	combee	3	55	hardy
416	vespiquen	12	385	hasty
417	pachirisu	4	39	hardy
418	buizel	7	295	bashful
419	floatzel	11	335	serious
420	cherubi	4	33	serious
421	cherrim	5	93	serious
422	shellos	3	63	hardy
423	gastrodon	9	299	hardy
424	ambipom	12	203	calm
425	drifloon	4	12	bold
426	drifblim	12	150	lonely
427	buneary	4	55	hasty
428	lopunny	12	333	calm
429	mismagius	9	44	serious
430	honchkrow	9	273	sassy
431	glameow	5	39	bold
432	purugly	10	438	hasty
433	chingling	2	6	calm
434	stunky	4	192	hardy
435	skuntank	10	380	hasty
436	bronzor	5	605	docile
437	bronzong	13	1870	adamant
438	bonsly	5	150	modest
439	mime-jr	6	130	hasty
440	happiny	6	244	adamant
441	chatot	5	19	hardy
442	spiritomb	10	1080	bold
443	gible	7	205	modest
444	gabite	14	560	serious
445	garchomp	19	950	bashful
446	munchlax	6	1050	quirky
447	riolu	7	202	hasty
448	lucario	12	540	relaxed
449	hippopotas	8	495	adamant
450	hippowdon	20	3000	bashful
451	skorupi	8	120	jolly
452	drapion	13	615	relaxed
453	croagunk	7	230	docile
454	toxicroak	13	444	jolly
455	carnivine	14	270	calm
456	finneon	4	70	serious
457	lumineon	12	240	bashful
458	mantyke	10	650	relaxed
459	snover	10	505	bold
460	abomasnow	22	1355	calm
461	weavile	11	340	sassy
462	magnezone	12	1800	mild
463	lickilicky	17	1400	hasty
464	rhyperior	24	2828	adamant
465	tangrowth	20	1286	bold
466	electivire	18	1386	bold
467	magmortar	16	680	bashful
468	togekiss	15	380	adamant
469	yanmega	19	515	serious
470	leafeon	10	255	quirky
471	glaceon	8	259	quirky
472	gliscor	20	425	bashful
473	mamoswine	25	2910	relaxed
474	porygon-z	9	340	sassy
475	gallade	16	520	modest
476	probopass	14	3400	sassy
477	dusknoir	22	1066	jolly
478	froslass	13	266	serious
479	rotom	3	3	hardy
480	uxie	3	3	docile
481	mesprit	3	3	hardy
482	azelf	3	3	serious
483	dialga	54	6830	lonely
484	palkia	42	3360	modest
485	heatran	17	4300	serious
486	regigigas	37	4200	hardy
487	giratina-altered	45	7500	serious
488	cresselia	15	856	serious
489	phione	4	31	adamant
490	manaphy	3	14	relaxed
491	darkrai	15	505	lonely
492	shaymin-land	2	21	quirky
493	arceus	32	3200	docile
494	victini	4	40	docile
495	snivy	6	81	jolly
496	servine	8	160	docile
497	serperior	33	630	mild
498	tepig	5	99	hasty
499	pignite	10	555	hardy
500	emboar	16	1500	hardy
501	oshawott	5	59	bold
502	dewott	8	245	hasty
503	samurott	15	946	mild
504	patrat	5	116	lonely
505	watchog	11	270	docile
506	lillipup	4	41	adamant
507	herdier	9	147	lonely
508	stoutland	12	610	bold
509	purrloin	4	101	bashful
510	liepard	11	375	serious
511	pansage	6	105	hardy
512	simisage	11	305	hasty
513	pansear	6	110	quirky
514	simisear	10	280	bashful
515	panpour	6	135	calm
516	simipour	10	290	serious
517	munna	6	233	lonely
518	musharna	11	605	mild
519	pidove	3	21	sassy
520	tranquill	6	150	serious
521	unfezant	12	290	modest
522	blitzle	8	298	adamant
523	zebstrika	16	795	jolly
524	roggenrola	4	180	jolly
525	boldore	9	1020	bold
526	gigalith	17	2600	modest
527	woobat	4	21	jolly
528	swoobat	9	105	quirky
529	drilbur	3	85	lonely
530	excadrill	7	404	bashful
531	audino	11	310	lonely
532	timburr	6	125	relaxed
533	gurdurr	12	400	sassy
534	conkeldurr	14	870	bashful
535	tympole	5	45	serious
536	palpitoad	8	170	calm
537	seismitoad	15	620	lonely
538	throh	13	555	mild
539	sawk	14	510	serious
540	sewaddle	3	25	mild
541	swadloon	5	73	hardy
542	leavanny	12	205	relaxed
543	venipede	4	53	calm
544	whirlipede	12	585	mild
545	scolipede	25	2005	hardy
546	cottonee	3	6	hardy
547	whimsicott	7	66	jolly
548	petilil	5	66	lonely
549	lilligant	11	163	sassy
550	basculin-red-striped	10	180	sassy
551	sandile	7	152	sassy
552	krokorok	10	334	relaxed
553	krookodile	15	963	sassy
554	darumaka	6	375	bashful
555	darmanitan-standard	13	929	relaxed
556	maractus	10	280	calm
557	dwebble	3	145	adamant
558	crustle	14	2000	hardy
559	scraggy	6	118	hardy
560	scrafty	11	300	calm
561	sigilyph	14	140	docile
562	yamask	5	15	quirky
563	cofagrigus	17	765	sassy
564	tirtouga	7	165	bold
565	carracosta	12	810	sassy
566	archen	5	95	hardy
567	archeops	14	320	quirky
568	trubbish	6	310	docile
569	garbodor	19	1073	lonely
570	zorua	7	125	sassy
571	zoroark	16	811	hasty
572	minccino	4	58	jolly
573	cinccino	5	75	modest
574	gothita	4	58	hasty
575	gothorita	7	180	docile
576	gothitelle	15	440	quirky
577	solosis	3	10	quirky
578	duosion	6	80	relaxed
579	reuniclus	10	201	docile
580	ducklett	5	55	hardy
581	swanna	13	242	lonely
582	vanillite	4	57	adamant
583	vanillish	11	410	bold
584	vanilluxe	13	575	calm
585	deerling	6	195	quirky
586	sawsbuck	19	925	mild
587	emolga	4	50	bashful
588	karrablast	5	59	docile
589	escavalier	10	330	docile
590	foongus	2	10	hasty
591	amoonguss	6	105	hardy
592	frillish	12	330	serious
593	jellicent	22	1350	bold
594	alomomola	12	316	sassy
595	joltik	1	6	serious
596	galvantula	8	143	modest
597	ferroseed	6	188	adamant
598	ferrothorn	10	1100	modest
599	klink	3	210	docile
600	klang	6	510	mild
601	klinklang	6	810	sassy
602	tynamo	2	3	jolly
603	eelektrik	12	220	modest
604	eelektross	21	805	adamant
605	elgyem	5	90	jolly
606	beheeyem	10	345	hardy
607	litwick	3	31	modest
608	lampent	6	130	mild
609	chandelure	10	343	sassy
610	axew	6	180	bold
611	fraxure	10	360	jolly
612	haxorus	18	1055	mild
613	cubchoo	5	85	mild
614	beartic	26	2600	hasty
615	cryogonal	11	1480	docile
616	shelmet	4	77	calm
617	accelgor	8	253	hasty
618	stunfisk	7	110	relaxed
619	mienfoo	9	200	hasty
620	mienshao	14	355	bold
621	druddigon	16	1390	serious
622	golett	10	920	bold
623	golurk	28	3300	hardy
624	pawniard	5	102	hardy
625	bisharp	16	700	calm
626	bouffalant	16	946	serious
627	rufflet	5	105	adamant
628	braviary	15	410	lonely
629	vullaby	5	90	bashful
630	mandibuzz	12	395	adamant
631	heatmor	14	580	serious
632	durant	3	330	bold
633	deino	8	173	lonely
634	zweilous	14	500	serious
635	hydreigon	18	1600	modest
636	larvesta	11	288	bashful
637	volcarona	16	460	serious
638	cobalion	21	2500	docile
639	terrakion	19	2600	bashful
640	virizion	20	2000	adamant
641	tornadus-incarnate	15	630	sassy
642	thundurus-incarnate	15	610	hardy
643	reshiram	32	3300	relaxed
644	zekrom	29	3450	mild
645	landorus-incarnate	15	680	sassy
646	kyurem	30	3250	hardy
647	keldeo-ordinary	14	485	hasty
648	meloetta-aria	6	65	bold
649	genesect	15	825	mild
650	chespin	4	90	bashful
651	quilladin	7	290	calm
652	chesnaught	16	900	docile
653	fennekin	4	94	modest
654	braixen	10	145	sassy
655	delphox	15	390	docile
656	froakie	3	70	calm
657	frogadier	6	109	docile
658	greninja	15	400	adamant
659	bunnelby	4	50	calm
660	diggersby	10	424	mild
661	fletchling	3	17	mild
662	fletchinder	7	160	jolly
663	talonflame	12	245	docile
664	scatterbug	3	25	mild
665	spewpa	3	84	jolly
666	vivillon	12	170	mild
667	litleo	6	135	serious
668	pyroar	15	815	hardy
669	flabebe	1	1	bashful
670	floette	2	9	lonely
671	florges	11	100	modest
672	skiddo	9	310	bashful
673	gogoat	17	910	bashful
674	pancham	6	80	jolly
675	pangoro	21	1360	bashful
676	furfrou	12	280	hardy
677	espurr	3	35	docile
678	meowstic-male	6	85	mild
679	honedge	8	20	relaxed
680	doublade	8	45	relaxed
681	aegislash-shield	17	530	hasty
682	spritzee	2	5	calm
683	aromatisse	8	155	relaxed
684	swirlix	4	35	hardy
685	slurpuff	8	50	bold
686	inkay	4	35	calm
687	malamar	15	470	modest
688	binacle	5	310	bold
689	barbaracle	13	960	mild
690	skrelp	5	73	adamant
691	dragalge	18	815	mild
692	clauncher	5	83	hardy
693	clawitzer	13	353	bashful
694	helioptile	5	60	mild
695	heliolisk	10	210	lonely
696	tyrunt	8	260	hasty
697	tyrantrum	25	2700	serious
698	amaura	13	252	docile
699	aurorus	27	2250	bashful
700	sylveon	10	235	quirky
701	hawlucha	8	215	hasty
702	dedenne	2	22	calm
703	carbink	3	57	hasty
704	goomy	3	28	mild
705	sliggoo	8	175	modest
706	goodra	20	1505	modest
707	klefki	2	30	adamant
708	phantump	4	70	adamant
709	trevenant	15	710	hasty
710	pumpkaboo-average	4	50	serious
711	gourgeist-average	9	125	docile
712	bergmite	10	995	hasty
713	avalugg	20	5050	serious
714	noibat	5	80	docile
715	noivern	15	850	jolly
716	xerneas	30	2150	lonely
717	yveltal	58	2030	jolly
718	zygarde	50	3050	adamant
719	diancie	7	88	docile
720	hoopa	5	90	sassy
721	volcanion	17	1950	quirky
10001	deoxys-attack	17	608	lonely
10002	deoxys-defense	17	608	adamant
10003	deoxys-speed	17	608	lonely
10004	wormadam-sandy	5	65	adamant
10005	wormadam-trash	5	65	calm
10006	shaymin-sky	4	52	docile
10007	giratina-origin	69	6500	hardy
10008	rotom-heat	3	3	bashful
10009	rotom-wash	3	3	quirky
10010	rotom-frost	3	3	modest
10011	rotom-fan	3	3	bold
10012	rotom-mow	3	3	relaxed
10013	castform-sunny	3	8	hardy
10014	castform-rainy	3	8	adamant
10015	castform-snowy	3	8	serious
10016	basculin-blue-striped	10	180	adamant
10017	darmanitan-zen	13	929	sassy
10018	meloetta-pirouette	6	65	bashful
10019	tornadus-therian	14	630	serious
10020	thundurus-therian	30	610	mild
10021	landorus-therian	13	680	relaxed
10022	kyurem-black	33	3250	adamant
10023	kyurem-white	36	3250	modest
10024	keldeo-resolute	14	485	lonely
10025	meowstic-female	6	85	adamant
10026	aegislash-blade	17	530	hasty
10027	pumpkaboo-small	3	35	lonely
10028	pumpkaboo-large	5	75	serious
10029	pumpkaboo-super	8	150	bold
10030	gourgeist-small	7	95	lonely
10031	gourgeist-large	11	140	calm
10032	gourgeist-super	17	390	serious
10033	venusaur-mega	24	1555	mild
10034	charizard-mega-x	17	1105	hasty
10035	charizard-mega-y	17	1005	jolly
10036	blastoise-mega	16	1011	relaxed
10037	alakazam-mega	12	480	bashful
10038	gengar-mega	14	405	bold
10039	kangaskhan-mega	22	1000	modest
10040	pinsir-mega	17	590	bold
10041	gyarados-mega	65	3050	modest
10042	aerodactyl-mega	21	790	docile
10043	mewtwo-mega-x	23	1270	lonely
10044	mewtwo-mega-y	15	330	docile
10045	ampharos-mega	14	615	hardy
10046	scizor-mega	20	1250	bashful
10047	heracross-mega	17	625	bold
10048	houndoom-mega	19	495	modest
10049	tyranitar-mega	25	2550	bold
10050	blaziken-mega	19	520	bashful
10051	gardevoir-mega	16	484	relaxed
10052	mawile-mega	10	235	quirky
10053	aggron-mega	22	3950	relaxed
10054	medicham-mega	13	315	hasty
10055	manectric-mega	18	440	quirky
10056	banette-mega	12	130	mild
10057	absol-mega	12	490	mild
10058	garchomp-mega	19	950	adamant
10059	lucario-mega	13	575	bold
10060	abomasnow-mega	27	1850	sassy
10061	floette-eternal	2	9	relaxed
10062	latias-mega	18	520	quirky
10063	latios-mega	23	700	docile
10064	swampert-mega	19	1020	docile
10065	sceptile-mega	19	552	sassy
10066	sableye-mega	5	1610	relaxed
10067	altaria-mega	15	206	calm
10068	gallade-mega	16	564	mild
10069	audino-mega	15	320	hardy
10070	sharpedo-mega	25	1303	hasty
10071	slowbro-mega	20	1200	bold
10072	steelix-mega	105	7400	serious
10073	pidgeot-mega	22	505	bold
10074	glalie-mega	21	3502	relaxed
10075	diancie-mega	11	278	docile
10076	metagross-mega	25	9429	hardy
10077	kyogre-primal	98	4300	calm
10078	groudon-primal	50	9997	bashful
10079	rayquaza-mega	108	3920	sassy
10080	pikachu-rock-star	40	60	hasty
10081	pikachu-belle	40	60	lonely
10082	pikachu-pop-star	40	60	hasty
10083	pikachu-phd	40	60	bashful
10084	pikachu-libre	40	60	quirky
10085	pikachu-cosplay	40	60	calm
10086	hoopa-unbound	65	4900	adamant
10087	camerupt-mega	25	3205	bashful
10088	lopunny-mega	13	283	calm
10089	salamence-mega	18	1126	hardy
10090	beedrill-mega	14	405	relaxed
\.


--
-- Name: poke_base_pokemon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('poke_base_pokemon_id_seq', 1, false);


--
-- Data for Name: poketypes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY poketypes (poketype_id, pokemon_id, type_id) FROM stdin;
1	1	12
2	1	4
3	2	12
4	2	4
5	3	12
6	3	4
7	4	10
8	5	10
9	6	10
10	6	3
11	7	11
12	8	11
13	9	11
14	10	7
15	11	7
16	12	7
17	12	3
18	13	7
19	13	4
20	14	7
21	14	4
22	15	7
23	15	4
24	16	1
25	16	3
26	17	1
27	17	3
28	18	1
29	18	3
30	19	1
31	20	1
32	21	1
33	21	3
34	22	1
35	22	3
36	23	4
37	24	4
38	25	13
39	26	13
40	27	5
41	28	5
42	29	4
43	30	4
44	31	4
45	31	5
46	32	4
47	33	4
48	34	4
49	34	5
50	35	18
51	36	18
52	37	10
53	38	10
54	39	1
55	39	18
56	40	1
57	40	18
58	41	4
59	41	3
60	42	4
61	42	3
62	43	12
63	43	4
64	44	12
65	44	4
66	45	12
67	45	4
68	46	7
69	46	12
70	47	7
71	47	12
72	48	7
73	48	4
74	49	7
75	49	4
76	50	5
77	51	5
78	52	1
79	53	1
80	54	11
81	55	11
82	56	2
83	57	2
84	58	10
85	59	10
86	60	11
87	61	11
88	62	11
89	62	2
90	63	14
91	64	14
92	65	14
93	66	2
94	67	2
95	68	2
96	69	12
97	69	4
98	70	12
99	70	4
100	71	12
101	71	4
102	72	11
103	72	4
104	73	11
105	73	4
106	74	6
107	74	5
108	75	6
109	75	5
110	76	6
111	76	5
112	77	10
113	78	10
114	79	11
115	79	14
116	80	11
117	80	14
118	81	13
119	81	9
120	82	13
121	82	9
122	83	1
123	83	3
124	84	1
125	84	3
126	85	1
127	85	3
128	86	11
129	87	11
130	87	15
131	88	4
132	89	4
133	90	11
134	91	11
135	91	15
136	92	8
137	92	4
138	93	8
139	93	4
140	94	8
141	94	4
142	95	6
143	95	5
144	96	14
145	97	14
146	98	11
147	99	11
148	100	13
149	101	13
150	102	12
151	102	14
152	103	12
153	103	14
154	104	5
155	105	5
156	106	2
157	107	2
158	108	1
159	109	4
160	110	4
161	111	5
162	111	6
163	112	5
164	112	6
165	113	1
166	114	12
167	115	1
168	116	11
169	117	11
170	118	11
171	119	11
172	120	11
173	121	11
174	121	14
175	122	14
176	122	18
177	123	7
178	123	3
179	124	15
180	124	14
181	125	13
182	126	10
183	127	7
184	128	1
185	129	11
186	130	11
187	130	3
188	131	11
189	131	15
190	132	1
191	133	1
192	134	11
193	135	13
194	136	10
195	137	1
196	138	6
197	138	11
198	139	6
199	139	11
200	140	6
201	140	11
202	141	6
203	141	11
204	142	6
205	142	3
206	143	1
207	144	15
208	144	3
209	145	13
210	145	3
211	146	10
212	146	3
213	147	16
214	148	16
215	149	16
216	149	3
217	150	14
218	151	14
219	152	12
220	153	12
221	154	12
222	155	10
223	156	10
224	157	10
225	158	11
226	159	11
227	160	11
228	161	1
229	162	1
230	163	1
231	163	3
232	164	1
233	164	3
234	165	7
235	165	3
236	166	7
237	166	3
238	167	7
239	167	4
240	168	7
241	168	4
242	169	4
243	169	3
244	170	11
245	170	13
246	171	11
247	171	13
248	172	13
249	173	18
250	174	1
251	174	18
252	175	18
253	176	18
254	176	3
255	177	14
256	177	3
257	178	14
258	178	3
259	179	13
260	180	13
261	181	13
262	182	12
263	183	11
264	183	18
265	184	11
266	184	18
267	185	6
268	186	11
269	187	12
270	187	3
271	188	12
272	188	3
273	189	12
274	189	3
275	190	1
276	191	12
277	192	12
278	193	7
279	193	3
280	194	11
281	194	5
282	195	11
283	195	5
284	196	14
285	197	17
286	198	17
287	198	3
288	199	11
289	199	14
290	200	8
291	201	14
292	202	14
293	203	1
294	203	14
295	204	7
296	205	7
297	205	9
298	206	1
299	207	5
300	207	3
301	208	9
302	208	5
303	209	18
304	210	18
305	211	11
306	211	4
307	212	7
308	212	9
309	213	7
310	213	6
311	214	7
312	214	2
313	215	17
314	215	15
315	216	1
316	217	1
317	218	10
318	219	10
319	219	6
320	220	15
321	220	5
322	221	15
323	221	5
324	222	11
325	222	6
326	223	11
327	224	11
328	225	15
329	225	3
330	226	11
331	226	3
332	227	9
333	227	3
334	228	17
335	228	10
336	229	17
337	229	10
338	230	11
339	230	16
340	231	5
341	232	5
342	233	1
343	234	1
344	235	1
345	236	2
346	237	2
347	238	15
348	238	14
349	239	13
350	240	10
351	241	1
352	242	1
353	243	13
354	244	10
355	245	11
356	246	6
357	246	5
358	247	6
359	247	5
360	248	6
361	248	17
362	249	14
363	249	3
364	250	10
365	250	3
366	251	14
367	251	12
368	252	12
369	253	12
370	254	12
371	255	10
372	256	10
373	256	2
374	257	10
375	257	2
376	258	11
377	259	11
378	259	5
379	260	11
380	260	5
381	261	17
382	262	17
383	263	1
384	264	1
385	265	7
386	266	7
387	267	7
388	267	3
389	268	7
390	269	7
391	269	4
392	270	11
393	270	12
394	271	11
395	271	12
396	272	11
397	272	12
398	273	12
399	274	12
400	274	17
401	275	12
402	275	17
403	276	1
404	276	3
405	277	1
406	277	3
407	278	11
408	278	3
409	279	11
410	279	3
411	280	14
412	280	18
413	281	14
414	281	18
415	282	14
416	282	18
417	283	7
418	283	11
419	284	7
420	284	3
421	285	12
422	286	12
423	286	2
424	287	1
425	288	1
426	289	1
427	290	7
428	290	5
429	291	7
430	291	3
431	292	7
432	292	8
433	293	1
434	294	1
435	295	1
436	296	2
437	297	2
438	298	1
439	298	18
440	299	6
441	300	1
442	301	1
443	302	17
444	302	8
445	303	9
446	303	18
447	304	9
448	304	6
449	305	9
450	305	6
451	306	9
452	306	6
453	307	2
454	307	14
455	308	2
456	308	14
457	309	13
458	310	13
459	311	13
460	312	13
461	313	7
462	314	7
463	315	12
464	315	4
465	316	4
466	317	4
467	318	11
468	318	17
469	319	11
470	319	17
471	320	11
472	321	11
473	322	10
474	322	5
475	323	10
476	323	5
477	324	10
478	325	14
479	326	14
480	327	1
481	328	5
482	329	5
483	329	16
484	330	5
485	330	16
486	331	12
487	332	12
488	332	17
489	333	1
490	333	3
491	334	16
492	334	3
493	335	1
494	336	4
495	337	6
496	337	14
497	338	6
498	338	14
499	339	11
500	339	5
501	340	11
502	340	5
503	341	11
504	342	11
505	342	17
506	343	5
507	343	14
508	344	5
509	344	14
510	345	6
511	345	12
512	346	6
513	346	12
514	347	6
515	347	7
516	348	6
517	348	7
518	349	11
519	350	11
520	351	1
521	352	1
522	353	8
523	354	8
524	355	8
525	356	8
526	357	12
527	357	3
528	358	14
529	359	17
530	360	14
531	361	15
532	362	15
533	363	15
534	363	11
535	364	15
536	364	11
537	365	15
538	365	11
539	366	11
540	367	11
541	368	11
542	369	11
543	369	6
544	370	11
545	371	16
546	372	16
547	373	16
548	373	3
549	374	9
550	374	14
551	375	9
552	375	14
553	376	9
554	376	14
555	377	6
556	378	15
557	379	9
558	380	16
559	380	14
560	381	16
561	381	14
562	382	11
563	383	5
564	384	16
565	384	3
566	385	9
567	385	14
568	386	14
569	387	12
570	388	12
571	389	12
572	389	5
573	390	10
574	391	10
575	391	2
576	392	10
577	392	2
578	393	11
579	394	11
580	395	11
581	395	9
582	396	1
583	396	3
584	397	1
585	397	3
586	398	1
587	398	3
588	399	1
589	400	1
590	400	11
591	401	7
592	402	7
593	403	13
594	404	13
595	405	13
596	406	12
597	406	4
598	407	12
599	407	4
600	408	6
601	409	6
602	410	6
603	410	9
604	411	6
605	411	9
606	412	7
607	413	7
608	413	12
609	414	7
610	414	3
611	415	7
612	415	3
613	416	7
614	416	3
615	417	13
616	418	11
617	419	11
618	420	12
619	421	12
620	422	11
621	423	11
622	423	5
623	424	1
624	425	8
625	425	3
626	426	8
627	426	3
628	427	1
629	428	1
630	429	8
631	430	17
632	430	3
633	431	1
634	432	1
635	433	14
636	434	4
637	434	17
638	435	4
639	435	17
640	436	9
641	436	14
642	437	9
643	437	14
644	438	6
645	439	14
646	439	18
647	440	1
648	441	1
649	441	3
650	442	8
651	442	17
652	443	16
653	443	5
654	444	16
655	444	5
656	445	16
657	445	5
658	446	1
659	447	2
660	448	2
661	448	9
662	449	5
663	450	5
664	451	4
665	451	7
666	452	4
667	452	17
668	453	4
669	453	2
670	454	4
671	454	2
672	455	12
673	456	11
674	457	11
675	458	11
676	458	3
677	459	12
678	459	15
679	460	12
680	460	15
681	461	17
682	461	15
683	462	13
684	462	9
685	463	1
686	464	5
687	464	6
688	465	12
689	466	13
690	467	10
691	468	18
692	468	3
693	469	7
694	469	3
695	470	12
696	471	15
697	472	5
698	472	3
699	473	15
700	473	5
701	474	1
702	475	14
703	475	2
704	476	6
705	476	9
706	477	8
707	478	15
708	478	8
709	479	13
710	479	8
711	480	14
712	481	14
713	482	14
714	483	9
715	483	16
716	484	11
717	484	16
718	485	10
719	485	9
720	486	1
721	487	8
722	487	16
723	488	14
724	489	11
725	490	11
726	491	17
727	492	12
728	493	1
729	494	14
730	494	10
731	495	12
732	496	12
733	497	12
734	498	10
735	499	10
736	499	2
737	500	10
738	500	2
739	501	11
740	502	11
741	503	11
742	504	1
743	505	1
744	506	1
745	507	1
746	508	1
747	509	17
748	510	17
749	511	12
750	512	12
751	513	10
752	514	10
753	515	11
754	516	11
755	517	14
756	518	14
757	519	1
758	519	3
759	520	1
760	520	3
761	521	1
762	521	3
763	522	13
764	523	13
765	524	6
766	525	6
767	526	6
768	527	14
769	527	3
770	528	14
771	528	3
772	529	5
773	530	5
774	530	9
775	531	1
776	532	2
777	533	2
778	534	2
779	535	11
780	536	11
781	536	5
782	537	11
783	537	5
784	538	2
785	539	2
786	540	7
787	540	12
788	541	7
789	541	12
790	542	7
791	542	12
792	543	7
793	543	4
794	544	7
795	544	4
796	545	7
797	545	4
798	546	12
799	546	18
800	547	12
801	547	18
802	548	12
803	549	12
804	550	11
805	551	5
806	551	17
807	552	5
808	552	17
809	553	5
810	553	17
811	554	10
812	555	10
813	556	12
814	557	7
815	557	6
816	558	7
817	558	6
818	559	17
819	559	2
820	560	17
821	560	2
822	561	14
823	561	3
824	562	8
825	563	8
826	564	11
827	564	6
828	565	11
829	565	6
830	566	6
831	566	3
832	567	6
833	567	3
834	568	4
835	569	4
836	570	17
837	571	17
838	572	1
839	573	1
840	574	14
841	575	14
842	576	14
843	577	14
844	578	14
845	579	14
846	580	11
847	580	3
848	581	11
849	581	3
850	582	15
851	583	15
852	584	15
853	585	1
854	585	12
855	586	1
856	586	12
857	587	13
858	587	3
859	588	7
860	589	7
861	589	9
862	590	12
863	590	4
864	591	12
865	591	4
866	592	11
867	592	8
868	593	11
869	593	8
870	594	11
871	595	7
872	595	13
873	596	7
874	596	13
875	597	12
876	597	9
877	598	12
878	598	9
879	599	9
880	600	9
881	601	9
882	602	13
883	603	13
884	604	13
885	605	14
886	606	14
887	607	8
888	607	10
889	608	8
890	608	10
891	609	8
892	609	10
893	610	16
894	611	16
895	612	16
896	613	15
897	614	15
898	615	15
899	616	7
900	617	7
901	618	5
902	618	13
903	619	2
904	620	2
905	621	16
906	622	5
907	622	8
908	623	5
909	623	8
910	624	17
911	624	9
912	625	17
913	625	9
914	626	1
915	627	1
916	627	3
917	628	1
918	628	3
919	629	17
920	629	3
921	630	17
922	630	3
923	631	10
924	632	7
925	632	9
926	633	17
927	633	16
928	634	17
929	634	16
930	635	17
931	635	16
932	636	7
933	636	10
934	637	7
935	637	10
936	638	9
937	638	2
938	639	6
939	639	2
940	640	12
941	640	2
942	641	3
943	642	13
944	642	3
945	643	16
946	643	10
947	644	16
948	644	13
949	645	5
950	645	3
951	646	16
952	646	15
953	647	11
954	647	2
955	648	1
956	648	14
957	649	7
958	649	9
959	650	12
960	651	12
961	652	12
962	652	2
963	653	10
964	654	10
965	655	10
966	655	14
967	656	11
968	657	11
969	658	11
970	658	17
971	659	1
972	660	1
973	660	5
974	661	1
975	661	3
976	662	10
977	662	3
978	663	10
979	663	3
980	664	7
981	665	7
982	666	7
983	666	3
984	667	10
985	667	1
986	668	10
987	668	1
988	669	18
989	670	18
990	671	18
991	672	12
992	673	12
993	674	2
994	675	2
995	675	17
996	676	1
997	677	14
998	678	14
999	679	9
1000	679	8
1001	680	9
1002	680	8
1003	681	9
1004	681	8
1005	682	18
1006	683	18
1007	684	18
1008	685	18
1009	686	17
1010	686	14
1011	687	17
1012	687	14
1013	688	6
1014	688	11
1015	689	6
1016	689	11
1017	690	4
1018	690	11
1019	691	4
1020	691	16
1021	692	11
1022	693	11
1023	694	13
1024	694	1
1025	695	13
1026	695	1
1027	696	6
1028	696	16
1029	697	6
1030	697	16
1031	698	6
1032	698	15
1033	699	6
1034	699	15
1035	700	18
1036	701	2
1037	701	3
1038	702	13
1039	702	18
1040	703	6
1041	703	18
1042	704	16
1043	705	16
1044	706	16
1045	707	9
1046	707	18
1047	708	8
1048	708	12
1049	709	8
1050	709	12
1051	710	8
1052	710	12
1053	711	8
1054	711	12
1055	712	15
1056	713	15
1057	714	3
1058	714	16
1059	715	3
1060	715	16
1061	716	18
1062	717	17
1063	717	3
1064	718	16
1065	718	5
1066	719	6
1067	719	18
1068	720	14
1069	720	8
1070	721	10
1071	721	11
1072	10001	14
1073	10002	14
1074	10003	14
1075	10004	7
1076	10004	5
1077	10005	7
1078	10005	9
1079	10006	12
1080	10006	3
1081	10007	8
1082	10007	16
1083	10008	13
1084	10008	10
1085	10009	13
1086	10009	11
1087	10010	13
1088	10010	15
1089	10011	13
1090	10011	3
1091	10012	13
1092	10012	12
1093	10013	10
1094	10014	11
1095	10015	15
1096	10016	11
1097	10017	10
1098	10017	14
1099	10018	1
1100	10018	2
1101	10019	3
1102	10020	13
1103	10020	3
1104	10021	5
1105	10021	3
1106	10022	16
1107	10022	15
1108	10023	16
1109	10023	15
1110	10024	11
1111	10024	2
1112	10025	14
1113	10026	9
1114	10026	8
1115	10027	8
1116	10027	12
1117	10028	8
1118	10028	12
1119	10029	8
1120	10029	12
1121	10030	8
1122	10030	12
1123	10031	8
1124	10031	12
1125	10032	8
1126	10032	12
1127	10033	12
1128	10033	4
1129	10034	10
1130	10034	16
1131	10035	10
1132	10035	3
1133	10036	11
1134	10037	14
1135	10038	8
1136	10038	4
1137	10039	1
1138	10040	7
1139	10040	3
1140	10041	11
1141	10041	17
1142	10042	6
1143	10042	3
1144	10043	14
1145	10043	2
1146	10044	14
1147	10045	13
1148	10045	16
1149	10046	7
1150	10046	9
1151	10047	7
1152	10047	2
1153	10048	17
1154	10048	10
1155	10049	6
1156	10049	17
1157	10050	10
1158	10050	2
1159	10051	14
1160	10051	18
1161	10052	9
1162	10052	18
1163	10053	9
1164	10054	2
1165	10054	14
1166	10055	13
1167	10056	8
1168	10057	17
1169	10058	16
1170	10058	5
1171	10059	2
1172	10059	9
1173	10060	12
1174	10060	15
1175	10061	18
1176	10062	16
1177	10062	14
1178	10063	16
1179	10063	14
1180	10064	11
1181	10064	5
1182	10065	12
1183	10065	16
1184	10066	17
1185	10066	8
1186	10067	16
1187	10067	18
1188	10068	14
1189	10068	2
1190	10069	1
1191	10069	18
1192	10070	11
1193	10070	17
1194	10071	11
1195	10071	14
1196	10072	9
1197	10072	5
1198	10073	1
1199	10073	3
1200	10074	15
1201	10075	6
1202	10075	18
1203	10076	9
1204	10076	14
1205	10077	11
1206	10078	5
1207	10078	10
1208	10079	16
1209	10079	3
1210	10080	13
1211	10081	13
1212	10082	13
1213	10083	13
1214	10084	13
1215	10085	13
1216	10086	14
1217	10086	17
1218	10087	10
1219	10087	5
1220	10088	1
1221	10088	2
1222	10089	16
1223	10089	3
1224	10090	7
1225	10090	4
\.


--
-- Name: poketypes_poketype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('poketypes_poketype_id_seq', 1225, true);


--
-- Data for Name: type_base; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY type_base (type_id, identifier) FROM stdin;
1	normal
2	fighting
3	flying
4	poison
5	ground
6	rock
7	bug
8	ghost
9	steel
10	fire
11	water
12	grass
13	electric
14	psychic
15	ice
16	dragon
17	dark
18	fairy
10001	unknown
10002	shadow
\.


--
-- Name: type_base_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('type_base_type_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, username, email, password, first_name, last_name, user_since) FROM stdin;
3	designsbytraina	rachel@rtg.com	5ebe2294ecd0e0f08eab7690d2a6ee69	Rachel	Traina-Grandon	2016-09-01 19:24:23
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 3, true);


--
-- Name: encounters_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY encounters
    ADD CONSTRAINT encounters_pkey PRIMARY KEY (encounter_id);


--
-- Name: gyms_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY gyms
    ADD CONSTRAINT gyms_pkey PRIMARY KEY (gym_id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: poke_base_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY poke_base
    ADD CONSTRAINT poke_base_pkey PRIMARY KEY (pokemon_id);


--
-- Name: poketypes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY poketypes
    ADD CONSTRAINT poketypes_pkey PRIMARY KEY (poketype_id);


--
-- Name: type_base_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY type_base
    ADD CONSTRAINT type_base_pkey PRIMARY KEY (type_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: encounters_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY encounters
    ADD CONSTRAINT encounters_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES poke_base(pokemon_id);


--
-- Name: poketypes_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY poketypes
    ADD CONSTRAINT poketypes_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES poke_base(pokemon_id);


--
-- Name: poketypes_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY poketypes
    ADD CONSTRAINT poketypes_type_id_fkey FOREIGN KEY (type_id) REFERENCES type_base(type_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

