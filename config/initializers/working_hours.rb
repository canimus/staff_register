WorkingHours::Config.working_hours = {
	mon: {'09:00' => '12:00', '13:00' => '17:00'},
	tue: {'09:00' => '12:00', '13:00' => '17:00'},
	wed: {'09:00' => '12:00', '13:00' => '17:00'},
	thu: {'09:00' => '12:00', '13:00' => '17:00'},
	fri: {'09:00' => '12:00', '13:00' => '17:00'}
}

WorkingHours::Config.time_zone = 'Amsterdam'

WorkingHours::Config.holidays = [
	# AUSTRALIA
	Date.parse('January 1, 2017'),     # New Year's Day
	Date.parse('January 26, 2015'),    # Australia Day
	Date.parse('March 2, 2015'),       # Labour Day
	Date.parse('April 3, 2015'),       # Good Friday
	Date.parse('April 6, 2015'),       # Easter Monday
	Date.parse('April 25, 2015'),      # ANZAC Day
	Date.parse('April 27, 2015'),      # ANZAC Day
	Date.parse('June 1, 2015'),        # Western Australia Day
	Date.parse('September 28, 2015'),  # Queen's Birthday
	Date.parse('December 25, 2015'),    # Christmas Day
	Date.parse('December 26, 2015'),    # Boxing Day
	Date.parse('December 28, 2015')    # Boxing Day

	# NETHERLANDS
	Date.parse('Jan 1,	2017'),	#New Year's Day	National holiday
	Date.parse('Mar 20,	2017'),	#March equinox	Season
	Date.parse('Apr 14,	2017'),	#Good Friday	Observance
	Date.parse('Apr 16,	2017'),	#Easter Day	National holiday
	Date.parse('Apr 17,	2017'),	#Easter Monday	National holiday
	Date.parse('Apr 27,	2017'),	#King's Birthday	National holiday
	Date.parse('May 4,	2017'),	#Remembrance Day	Observance
	Date.parse('May 5,	2017'),	#Liberation Day	Observance
	Date.parse('May 25,	2017'),	#Ascension Day	National holiday
	Date.parse('Jun 4,	2017'),	#Whit Sunday	National holiday
	Date.parse('Jun 5,	2017'),	#Whit Monday	National holiday
	Date.parse('Jun 21,	2017'),	#June Solstice	Season
	Date.parse('Sep 22,	2017'),	#September equinox	Season
	Date.parse('Dec 5,	2017'),	#St Nicholas' Eve/Sinterklaas	Observance
	Date.parse('Dec 6,	2017'),	#St Nicholas' Day	Observance
	Date.parse('Dec 21,	2017'),	#December Solstice	Season
	Date.parse('Dec 24,	2017'),	#Christmas Eve	Observance
	Date.parse('Dec 25,	2017'),	#Christmas Day	National holiday
	Date.parse('Dec 26,	2017'),	#Second Day of Christmas	National holiday
	Date.parse('Dec 31,	2017')	#New Year's Eve	Observance
]
