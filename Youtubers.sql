#SELECT * FROM portfolioproject2.`global youtube statistics`;
#1. Top 5 continents in the Youtube space; upload, views, subscriptions and earnings
SELECT 
   CASE
	 WHEN Country in ('Algeria', 'Angola', 'Benin','Botswana', 'Burkina Faso','Burundi','Cabo Verde','Cameroon','Central African Republic','Chad','Comoros','Congo (Brazzaville)', 'Congo (Kinshasa)', 'Cote dIvoire', 'Djibouti', 
	 'Egypt', 'Equatorial Guinea', 'Eritrea', 'Eswatini', 'Ethiopia', 'Gabon', 'Gambia', 'Ghana', 'Guinea', 'Guinea-Bissau', 'Kenya', 'Lesotho', 'Liberia', 'Libya', 'Madagascar', 'Malawi', 'Mali', 'Mauritania', 'Mauritius', 
	 'Morocco', 'Mozambique', 'Namibia', 'Niger', 'Nigeria', 'Rwanda', 'Sao Tome and Principe', 'Senegal', 'Seychelles', 'Sierra Leone', 'Somalia', 'South Africa', 'South Sudan', 'Sudan', 'Tanzania', 'Togo','Tunisia','Uganda',
	 'Zambia','Zimbabwe') then 'Africa'
	 
	 WHEN Country in ('Afghanistan', 'Armenia', 'Azerbaijan', 'Bahrain', 'Bangladesh', 'Bhutan', 'Brunei', 'Cambodia', 'China', 'Cyprus', 'Georgia', 'India', 'Indonesia', 'Iran', 'Iraq', 'Israel', 'Japan', 'Jordan', 'Kazakhstan', 
	 'Kuwait', 'Kyrgyzstan', 'Laos', 'Lebanon', 'Malaysia', 'Maldives', 'Mongolia', 'Myanmar', 'Nepal', 'North Korea', 'Oman', 'Pakistan', 'Palestine', 'Philippines', 'Qatar', 'Saudi Arabia', 'Singapore', 'South Korea', 'Sri Lanka', 
	 'Syria', 'Tajikistan', 'Thailand', 'Timor-Leste', 'Turkey', 'Turkmenistan', 'United Arab Emirates', 'Uzbekistan', 'Vietnam', 'Yemen') then 'Asia'

	 WHEN Country in ('Australia', 'Fiji', 'Kiribati', 'Marshall Islands', 'Micronesia', 'Nauru', 'New Zealand', 'Palau', 'Papua New Guinea', 'Samoa', 'Solomon Islands', 'Tonga', 'Tuvalu', 'Vanuatu') then 'Australasia/Oceania'

	 WHEN Country in ( 'Albania', 'Andorra', 'Austria', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria', 'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 
	 'Iceland', 'Ireland', 'Italy', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Malta', 'Moldova', 'Monaco', 'Montenegro', 'Netherlands', 'North Macedonia', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 
	 'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 'Switzerland', 'Ukraine', 'United Kingdom', 'Vatican City') then 'Europe'

	 WHEN Country in ('Antigua and Barbuda', 'The Bahamas', 'Barbados', 'Belize', 'Canada', 'Costa Rica', 'Cuba', 'Dominica', 'Dominican Republic', 'El Salvador', 'Grenada', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 
	 'Nicaragua', 'Panama', 'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Vincent and the Grenadines', 'Trinidad and Tobago', 'United States') then 'North America'

	 When Country in ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay','Venezuela') then 'South America'
end AS continents,

COUNT(Youtuber) as num_of_youtubers,
SUM(uploads) as total_uploads, 
SUM(`video views`) as total_views, 
SUM(subscribers) as total_subs, 
round(SUM(highest_yearly_earnings),0) as yearly_earnings

FROM portfolioproject2.`global youtube statistics`
GROUP BY continents
ORDER BY 6 DESC;

#2. Percentage of earnings per continent
#Using CTE
With perc_pay as (
SELECT 
   CASE
	 WHEN Country in ('Algeria', 'Angola', 'Benin','Botswana', 'Burkina Faso','Burundi','Cabo Verde','Cameroon','Central African Republic','Chad','Comoros','Congo (Brazzaville)', 'Congo (Kinshasa)', 'Cote dIvoire', 'Djibouti', 
	 'Egypt', 'Equatorial Guinea', 'Eritrea', 'Eswatini', 'Ethiopia', 'Gabon', 'Gambia', 'Ghana', 'Guinea', 'Guinea-Bissau', 'Kenya', 'Lesotho', 'Liberia', 'Libya', 'Madagascar', 'Malawi', 'Mali', 'Mauritania', 'Mauritius', 
	 'Morocco', 'Mozambique', 'Namibia', 'Niger', 'Nigeria', 'Rwanda', 'Sao Tome and Principe', 'Senegal', 'Seychelles', 'Sierra Leone', 'Somalia', 'South Africa', 'South Sudan', 'Sudan', 'Tanzania', 'Togo','Tunisia','Uganda',
	 'Zambia','Zimbabwe') then 'Africa'
	 
	 WHEN Country in ('Afghanistan', 'Armenia', 'Azerbaijan', 'Bahrain', 'Bangladesh', 'Bhutan', 'Brunei', 'Cambodia', 'China', 'Cyprus', 'Georgia', 'India', 'Indonesia', 'Iran', 'Iraq', 'Israel', 'Japan', 'Jordan', 'Kazakhstan', 
	 'Kuwait', 'Kyrgyzstan', 'Laos', 'Lebanon', 'Malaysia', 'Maldives', 'Mongolia', 'Myanmar', 'Nepal', 'North Korea', 'Oman', 'Pakistan', 'Palestine', 'Philippines', 'Qatar', 'Saudi Arabia', 'Singapore', 'South Korea', 'Sri Lanka', 
	 'Syria', 'Tajikistan', 'Thailand', 'Timor-Leste', 'Turkey', 'Turkmenistan', 'United Arab Emirates', 'Uzbekistan', 'Vietnam', 'Yemen') then 'Asia'

	 WHEN Country in ('Australia', 'Fiji', 'Kiribati', 'Marshall Islands', 'Micronesia', 'Nauru', 'New Zealand', 'Palau', 'Papua New Guinea', 'Samoa', 'Solomon Islands', 'Tonga', 'Tuvalu', 'Vanuatu') then 'Australasia/Oceania'

	 WHEN Country in ( 'Albania', 'Andorra', 'Austria', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria', 'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 
	 'Iceland', 'Ireland', 'Italy', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Malta', 'Moldova', 'Monaco', 'Montenegro', 'Netherlands', 'North Macedonia', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 
	 'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 'Switzerland', 'Ukraine', 'United Kingdom', 'Vatican City') then 'Europe'

	 WHEN Country in ('Antigua and Barbuda', 'The Bahamas', 'Barbados', 'Belize', 'Canada', 'Costa Rica', 'Cuba', 'Dominica', 'Dominican Republic', 'El Salvador', 'Grenada', 'Guatemala', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 
	 'Nicaragua', 'Panama', 'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Vincent and the Grenadines', 'Trinidad and Tobago', 'United States') then 'North America'

	 When Country in ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay','Venezuela') then 'South America'
end AS continents,
 
round(SUM(highest_yearly_earnings),0) as yearly_earnings

FROM portfolioproject2.`global youtube statistics`
GROUP BY continents
ORDER BY 2 DESC
)
SELECT 
SUM(yearly_earnings) as yearly_earnings,
round((SUM(CASE when continents = 'Africa' then yearly_earnings else 0 end)/SUM(yearly_earnings))*100,2) as african_perc_earnings,
round((SUM(CASE when continents ='Asia' then yearly_earnings else 0 end)/SUM(yearly_earnings))*100,2) as asian_perc_earnings,
round((SUM(CASE when continents = 'Australasia/Oceania' then yearly_earnings else 0 end)/SUM(yearly_earnings))*100,2) as aus_oc_perc_earnings,
round((SUM(CASE when continents = 'Europe' then yearly_earnings else 0 end)/SUM(yearly_earnings))*100,2) as european_perc_earnings, 
round((SUM(CASE when continents ='North America' then yearly_earnings else 0 end)/SUM(yearly_earnings))*100,2) as northamerica_perc_earnings, 
round((SUM(CASE when continents ='South America' then yearly_earnings else 0 end)/SUM(yearly_earnings))*100,2) as southamerica_perc_earnings 
FROM perc_pay;

#3. Top 10 countries, per earnings
SELECT Country, round(SUM(highest_yearly_earnings),0) as total_earnings
FROM portfolioproject2.`global youtube statistics`
GROUP BY Country
ORDER BY 2 DESC
LIMIT 10;

#4. Top 10 channel types, check by their number of views and see their number of subscribers
SELECT channel_type, SUM(`video views`) as total_views, SUM(subscribers) as total_subscribers
FROM portfolioproject2.`global youtube statistics`
GROUP BY channel_type
ORDER BY 2 DESC
LIMIT 10;


#5 Top 10 Youtubers, ranked by their total earnings
SELECT Youtuber,highest_yearly_earnings,uploads, Country
FROM portfolioproject2.`global youtube statistics`
ORDER BY 2 DESC
LIMIT 10
