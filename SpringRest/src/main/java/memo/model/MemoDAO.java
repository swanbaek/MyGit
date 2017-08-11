package memo.model;

import java.util.List;

public interface MemoDAO {
	int createMemo(MemoVO memo);

	List<MemoVO> listMemo();

	MemoVO getMemo(int idx);

	int updateMemo(MemoVO memo);

	int deleteMemo(int idx);
}
