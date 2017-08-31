package kr.co.hanbit;

import java.sql.SQLException;
import java.util.List;

public interface MemoDAO {
	public List<MemoVO> selectAllMemo() throws SQLException;
}
