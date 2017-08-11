package memo.service;

import java.util.List;

import memo.model.MemoVO;

public interface MemoService {
	
	int createMemo(MemoVO memo);
	
	List<MemoVO> listMemo();
	MemoVO getMemo(int idx);
	
	int updateMemo(MemoVO memo);
	
	int deleteMemo(int idx);

}
