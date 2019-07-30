/*#pragma once

void queryOne(string first, string second, mysqlx_session_t* sess) {
	char query1[] = { "SELECT count(album_id)"\
	 "from album where rec_s_date and rec_e_date between STR_TO_DATE(first, '%Y-%m-%d') and STR_TO_DATE(second, '%Y-%m-%d'); "};

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
		cerr << mysqlx_error_message(sess) << endl;
		exit(mysqlx_error_num(sess));
	}
}


void queryTwo(string first, string second, mysqlx_session_t* sess) {

}

void queryThird(string musician,string first, string second, mysqlx_session_t* sess) {

}

void queryFour(mysqlx_session_t* sess) {

}

void queryFifth(string album, mysqlx_session_t* sess) {

}

void querySixth(string first, string second, mysqlx_session_t* sess) {

}

void querySeventh(mysqlx_session_t* sess) {

}

void queryEigth(mysqlx_session_t* sess) {

}

void queryNinth(mysqlx_session_t* sess) {

}

void queryTenth(mysqlx_session_t* sess) {

}

void queryEleventh(string first, string second, mysqlx_session_t* sess) {

}

void queryTwelve(mysqlx_session_t* sess) {

}

void queryThirteen(int i,mysqlx_session_t* sess) {

}

void queryFourteenth(string name, mysqlx_session_t* sess) {

}

void queryFifteen(mysqlx_session_t* sess) {

}
*/
