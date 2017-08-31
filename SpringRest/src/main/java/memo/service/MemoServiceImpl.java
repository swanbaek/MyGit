package memo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import memo.model.MemoDAO;
import memo.model.MemoVO;
@Service
public class MemoServiceImpl implements MemoService {

	@Autowired
	private MemoDAO mdao;
	
	@Override
	public int createMemo(MemoVO memo) {
		// TODO Auto-generated method stub
		return mdao.createMemo(memo);
	}

	@Override
	public List<MemoVO> listMemo() {
		// TODO Auto-generated method stub
		return mdao.listMemo();
	}

	@Override
	public int updateMemo(MemoVO memo) {
		// TODO Auto-generated method stub
		return mdao.updateMemo(memo);
	}

	@Override
	public int deleteMemo(int idx) {
		// TODO Auto-generated method stub
		return mdao.deleteMemo(idx);
	}

	@Override
	public MemoVO getMemo(int idx) {
		// TODO Auto-generated method stub
		return mdao.getMemo(idx);
	}

}
