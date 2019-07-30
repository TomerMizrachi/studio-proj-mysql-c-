#include <mysqlx/xapi.h>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

void queryOne(string first, string second, mysqlx_session_t* sess) {

	string query = "SELECT count(album_id) from album where rec_s_date and rec_e_date between '" + first + "' and '" + second + "';";
	

	char* query1 = new char[query.length() +1];
	strcpy_s(query1, query.length() + 1,query.c_str());

	//cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	int64_t x;
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				//size = sizeof(buff);
				mysqlx_get_sint(row, 0, &x);
				cout << "the number of between dates:"<< x << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl;
		exit(mysqlx_error_num(sess));
	}
	delete[] query1;
}

void queryTwo(string first, string second, mysqlx_session_t* sess) {
	string fname;
	string last;
	cout << "please insert musician first name:" << endl;
	cin >> fname;
	
	cout << "please insert musician last name:" << endl;
	cin >> last;
	cout << endl;

	string query = "select count(song_has_musician.song_song_name) "\
		"from song_has_musician join musician "\
		"on musician.musician_id = song_has_musician.musician_musician_id "\
		"and musician.mus_f_name = '" + fname + "' and musician.mus_l_name = '" + last + "' "\
		"and song_has_musician.song_rec_date between '" + first + "' and '" + second + "';";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	int64_t x;
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				//size = sizeof(buff);
				mysqlx_get_sint(row, 0, &x);
				cout << "the number of songs that "<< fname << " " << last << " praticipate between dates: " << x << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl;
		exit(mysqlx_error_num(sess));
	}
	delete[] query1;
}

void queryThird(string first, string second, mysqlx_session_t* sess) {
	string fname;
	string last;
	cout << "please insert musician first name:" << endl;
	cin >> fname;

	cout << "please insert musician last name:" << endl;
	cin >> last;
	cout << endl;


	string query = "select  count(distinct(album_has_song.album_album_id)) "\
		"from song_has_musician join musician "\
		"on musician.musician_id = song_has_musician.musician_musician_id "
		"and musician.mus_f_name = '" + fname + "' and musician.mus_l_name = '"+ last +"' "\
		"and song_has_musician.song_rec_date between '" + first + "' and '" + second + "' "\
		"join album_has_song on song_has_musician.song_song_name = album_has_song.song_song_name;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

//cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	int64_t x;
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				//size = sizeof(buff);
				mysqlx_get_sint(row, 0, &x);
				cout << "the number of albums that " << fname << " " << last << " praticipate between dates: " << x << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl;
		exit(mysqlx_error_num(sess));
	}
	delete[] query1;
}

void queryFour(mysqlx_session_t* sess) {
	string query = "select inst_type "\
		"from musician_has_instrument join musician "\
		"on musician.musician_id = musician_has_instrument.musician_musician_id "\
		"join instrument on instrument_instrument_id = instrument.instrument_id "\
		"group by inst_type "\
		"order by count(inst_type) desc limit 1;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

    //	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << "the must common instrument is: "<< buff << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}
	delete[] query1;
}

void queryFifth(string album, mysqlx_session_t* sess) {
	string query = "select distinct(instrument.inst_type) "\
		"from album join album_has_song on album.album_id = album_has_song.album_album_id "\

		"join song_has_musician on album_has_song.song_song_name = song_has_musician.song_song_name "\

		"join musician_has_instrument on song_has_musician.musician_musician_id = musician_has_instrument.musician_musician_id "\

		"join instrument on musician_has_instrument.instrument_instrument_id = instrument.instrument_id "\

		"where album_name = '" + album + "';";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	
	cout << "the instruments in " << album << "are: " << endl;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << buff << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}
	delete[] query1;
}

void querySixth(string first, string second, mysqlx_session_t* sess) {
	string query = "select concat(producer.pro_f_n, ' ', producer.pro_l_n) as producerp  "\
		"from producer join album_has_producer on producer.producer_id = album_has_producer.producer_producer_id "\
		"join album on album_has_producer.album_album_id = album.album_id "\

		"where album.rec_s_date and album.rec_e_date between '" + first + "' and '" + second + "' "\
		"group by producer_id order by count(producer_id) desc limit 1;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << "the must busy producer is: " << buff << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}
	delete[] query1;
}

void querySeventh(mysqlx_session_t* sess) {
	string query = "select instrument.manufacturer "\
		"from album join album_has_song on album.album_id = album_has_song.album_album_id "\
		"join song_has_musician on album_has_song.song_song_name = song_has_musician.song_song_name "\
		"join musician_has_instrument "\
		"on song_has_musician.musician_musician_id = musician_has_instrument.musician_musician_id "\
		"join instrument on musician_has_instrument.instrument_instrument_id = instrument.instrument_id "\
		"group by manufacturer order by count(manufacturer) desc limit 1;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << "the must common manufacturer is: " << buff << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}

	delete[] query1;
}

void queryEigth(mysqlx_session_t* sess) {

	string query = "select count(distinct(musician_musician_id)) "\
		"from album join album_has_song on album.album_id = album_has_song.album_album_id "\
		"join song_has_musician on album_has_song.song_song_name = song_has_musician.song_song_name;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	//cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	int64_t x;
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				//size = sizeof(buff);
				mysqlx_get_sint(row, 0, &x);
				cout << "the number of musician recored in the studio:" << x << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl;
		exit(mysqlx_error_num(sess));
	}
	delete[] query1;
}

void queryNinth(mysqlx_session_t* sess) {
	string query = "select concat(musf1, ' ',musl1) as mu "\
		"from(select mus_f_name as musf1, mus_l_name as musl1, song_song_name from song_has_musician join musician)as a "\
		"join(select mus_f_name as musf2, mus_l_name as musl2, song_song_name from song_has_musician join musician)as b "\
		"on a.song_song_name = b.song_song_name "\
		"group by musf1 and musl1 "\
		"order by count(distinct(musf2 and musl2)) limit 1;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << "The musician who collaborated with most other musicians is: " << buff << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}

	delete[] query1;
}

void queryTenth(mysqlx_session_t* sess) {
	string query = "select genre from song group by genre order by count(genre) desc limit 1;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << "The most common genre is: " << buff << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}

	delete[] query1;
}

void queryEleventh(string first, string second, mysqlx_session_t* sess) {
	string query = "select concat(tech_f_name, ' ',tech_l_name) as tec "\
		"from  song join technician "\
		"where song.fk_tech_id = technician.tech_id "\
		"and song.rec_date between '" + first + "' and '" + second + "' "\
		"group by tech_id order by count(tech_id)desc limit 1;";

	cout << endl;
	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << "The most busy technician is: " << buff << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}

	delete[] query1;
}

void queryTwelve(mysqlx_session_t* sess) {
	string query = "select album_name from  album order by rec_e_date limit 1;";
	
	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << "The first album was recorded in the studio is: " << buff << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}

	delete[] query1;
}

void queryThirteen(mysqlx_session_t* sess) {
	int i, j = 0;
	cout << "please insert the number of albums:\n";
	cin >> i;
	
	vector <string> albums;
	string album;
	while (i)
	{
		cout << "please insert album " << i << endl;
		cin >> album;
		cout << endl;
		albums.push_back(album);
		i--;
	}
	while (j < albums.size())
	{

	string query = "SELECT album_has_song.song_song_name "\
		"from album join album_has_song on album.album_id = album_has_song.album_album_id "\
		"where album.album_name = '" + albums[j] + "';";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());
	cout << albums[j] << ":" << endl;
	//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << buff << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}
	j++;
	delete[] query1;
	cout << endl;
	}
}

void queryFourteenth(string name, mysqlx_session_t* sess) {
	string query = "select concat(technician.tech_f_name, ' ', technician.tech_l_name) as tech "\
		"from album join album_has_song on album.album_id = album_has_song.album_album_id "\
		"join song on song.song_name = album_has_song.song_song_name and song.rec_date = album_has_song.song_rec_date "\
		"join technician on technician.tech_id = song.fk_tech_id "\
		"where album.album_name = '" + name + "' "\
		"group by tech;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());


	cout << "the technucian in " << name << " are: " << endl;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << buff << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}
	cout << endl;
	delete[] query1;
}

void queryFifteen(mysqlx_session_t* sess) {
	string query = "select concat(musician.mus_f_name, ' ', musician.mus_l_name) as mus "\
		"from musician join song_has_musician "\
		"on musician.musician_id = song_has_musician.musician_musician_id "\
		"join song on song.song_name = song_has_musician.song_song_name and song.rec_date = song_has_musician.song_rec_date "\
		"group by mus_f_name, mus_l_name "\
		"order by count(distinct(song.genre))desc limit 1;";

	char* query1 = new char[query.length() + 1];
	strcpy_s(query1, query.length() + 1, query.c_str());

	//	cout << query1;
	mysqlx_result_t* res = mysqlx_sql(sess, query1, MYSQLX_NULL_TERMINATED);
	if (NULL != res) {
		char buff[256]; size_t size = 0;

		do {
			mysqlx_row_t* row = mysqlx_row_fetch_one(res);
			while (NULL != row) {
				size = sizeof(buff);
				mysqlx_get_bytes(row, 0, 0, buff, &size);
				cout << "The must diversified musician in the studio is: " << buff << endl << endl;
				row = mysqlx_row_fetch_one(res);
			}
		} while (RESULT_OK == mysqlx_next_result(res));
	}
	else {
		cerr << mysqlx_error_message(sess) << endl << endl;
		exit(mysqlx_error_num(sess));
	}

	delete[] query1;
}
int main() {

	int x = 1;
	int firstYear, secondYear, firstMonth, secondMonth, firstDay, secondDay, i;
	string firstDate, secondDate, buff;

	char err_msg[256] = {};
	mysqlx_error_t** err_code = 0;

	//creration of an sql connection aka session to the mysql server
	mysqlx_session_t* sess = mysqlx_get_session("localhost", DEFAULT_MYSQLX_PORT, "root", "root", "studio", err_code);
	if (NULL == sess) {
		cerr << err_msg << endl;
		exit(1);
	}



	while (x)
	{
		cout << "Hello welcome to stodio!\n"\
			"please chose one of the actions below:\n\n"\
			"1.  all the albums between two dates:\n"\
			"2.  how many songs a certain musician recorded by between two dates:\n"\
			"3.  how many albums a certain musician Participate by between two dates:\n"\
			"4.  the must popular instrument:\n"\
			"5.  the list of instruments in a certain album\n"\
			"6.  the must busy producer between two dates:\n"\
			"7.  the must popular manfacturer:\n"\
			"8.  how many musicians recorded in the studio:\n"\
			"9.  the musician that particpate with the most other musicians:\n"\
			"10. the must popular genre:\n"\
			"11. the must busy technician between two dates:\n"\
			"12. the first albuom that was recoreded in the studio:\n"\
			"13. all the song in serveral (2 or more) albums:\n"\
			"14. list of technician that particpate in specific album:\n"\
			"15. the musician that praticpate in the most more genre\n\n"\
			"0.  EXIT:\n"\
			">";

		cin >> x;
		cout << "\n";

		switch (x)
		{
		case 1:
			cout << "please insert first date year:\n";
			cin >> firstYear;
			cout << "please insert first date month:\n";
			cin >> firstMonth;
			cout << "please insert first date day:\n";
			cin >> firstDay;
			firstDate = to_string(firstYear) + "-" + to_string(firstMonth) + "-" + to_string(firstDay);

			cout << firstDate << endl;

			cout << "please insert second date year:\n";
			cin >> secondYear;
			cout << "please insert second date month:\n";
			cin >> secondMonth;
			cout << "please insert second date day:\n";
			cin >> secondDay;
			secondDate = to_string(secondYear) + "-" + to_string(secondMonth) + "-" + to_string(secondDay);

			cout << secondDate << endl;

			queryOne(firstDate, secondDate, sess);

			break;
		case 2:
			cout << "please insert first date year:\n";
			cin >> firstYear;
			cout << "please insert first date month:\n";
			cin >> firstMonth;
			cout << "please insert first date day:\n";
			cin >> firstDay;
			firstDate = to_string(firstYear) + "-" + to_string(firstMonth) + "-" + to_string(firstDay);

			cout << "please insert second date year:\n";
			cin >> secondYear;
			cout << "please insert second date month:\n";
			cin >> secondMonth;
			cout << "please insert second date day:\n";
			cin >> secondDay;
			secondDate = to_string(secondYear) + "-" + to_string(secondMonth) + "-" + to_string(secondDay);

			queryTwo(firstDate, secondDate, sess);
			break;
		case 3:
			cout << "please insert first date year:\n";
			cin >> firstYear;
			cout << "please insert first date month:\n";
			cin >> firstMonth;
			cout << "please insert first date day:\n";
			cin >> firstDay;
			firstDate = to_string(firstYear) + "-" + to_string(firstMonth) + "-" + to_string(firstDay);

			cout << "please insert second date year:\n";
			cin >> secondYear;
			cout << "please insert second date month:\n";
			cin >> secondMonth;
			cout << "please insert second date day:\n";
			cin >> secondDay;
			secondDate = to_string(secondYear) + "-" + to_string(secondMonth) + "-" + to_string(secondDay);

			queryThird(firstDate, secondDate, sess);


			break;
		case 4:
			queryFour(sess);
			break;
		case 5:
			cout << "please insert album name:\n";
			cin >> buff;
			queryFifth(buff, sess);
			break;
		case 6:
			cout << "please insert first date year:\n";
			cin >> firstYear;
			cout << "please insert first date month:\n";
			cin >> firstMonth;
			cout << "please insert first date day:\n";
			cin >> firstDay;
			firstDate = to_string(firstYear) + "-" + to_string(firstMonth) + "-" + to_string(firstDay);

			cout << "please insert second date year:\n";
			cin >> secondYear;
			cout << "please insert second date month:\n";
			cin >> secondMonth;
			cout << "please insert second date day:\n";
			cin >> secondDay;
			secondDate = to_string(secondYear) + "-" + to_string(secondMonth) + "-" + to_string(secondDay);

			querySixth(firstDate, secondDate, sess);
			break;
		case 7:
			querySeventh(sess);
			break;
		case 8:
			queryEigth(sess);
			break;
		case 9:
			queryNinth(sess);
			break;
		case 10:
			queryTenth(sess);
			break;
		case 11:
			cout << "please insert first date year:\n";
			cin >> firstYear;
			cout << "please insert first date month:\n";
			cin >> firstMonth;
			cout << "please insert first date day:\n";
			cin >> firstDay;
			firstDate = to_string(firstYear) + "-" + to_string(firstMonth) + "-" + to_string(firstDay);

			cout << "please insert second date year:\n";
			cin >> secondYear;
			cout << "please insert second date month:\n";
			cin >> secondMonth;
			cout << "please insert second date day:\n";
			cin >> secondDay;
			secondDate = to_string(secondYear) + "-" + to_string(secondMonth) + "-" + to_string(secondDay);

			queryEleventh(firstDate, secondDate, sess);
			break;
		case 12:
			queryTwelve(sess);
			break;
		case 13:
			queryThirteen(sess);
			break;
		case 14:
			cout << "please insert album name:\n";
			cin >> buff;
			queryFourteenth(buff, sess);
			break;
		case 15:
			queryFifteen(sess);
			break;
		default:
			cout << "Please try again:\n\n";
			break;
		}

	}
	mysqlx_session_close(sess);
	return 0;
}