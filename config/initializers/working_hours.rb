WorkingHours::Config.working_hours = {
	mon: {'09:00' => '12:00', '13:00' => '17:00'},
	tue: {'09:00' => '12:00', '13:00' => '17:00'},
	wed: {'09:00' => '12:00', '13:00' => '17:00'},
	thu: {'09:00' => '12:00', '13:00' => '17:00'},
	fri: {'09:00' => '12:00', '13:00' => '17:00'}
}

WorkingHours::Config.time_zone = 'Perth'

WorkingHours::Config.holidays = [
	Date.parse('January 1, 2015'),     # New Year's Day 
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
]