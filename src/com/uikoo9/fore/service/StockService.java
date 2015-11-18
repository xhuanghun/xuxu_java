package com.uikoo9.fore.service;

import java.math.BigDecimal;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.uikoo9.util.core.data.QArrayUtil;
import com.uikoo9.util.core.data.QStringUtil;

/**
 * Stock Service
 * @author qiaowenbin
 */
public class StockService {

	/**
	 * 获取股票数据通过股票代码
	 * @param code
	 * @return
	 */
	public List<Record> findStockDataByCode(String code){
		List<Record> res = null;
		
		if(QStringUtil.notEmpty(code)){
			Page<Record> pages = Db.paginate(1, 5, "select *", "from t_stock_data where stock_data_code like '%" + code + "%'");
			if(pages != null && QArrayUtil.notEmpty(pages.getList())) res = pages.getList();
		}
		
		return res;
	}
	
	/**
	 * 获取股票汇总列表
	 * @return
	 */
	public List<Record> getStockSum(){
		String sql = 
				"SELECT " +
					"sdata.id sid, sdata.stock_data_code scode, sdata.stock_data_name sname, SUM(sdetail.stock_detail_num*sdetail.stock_detail_price) ssum " +
				"FROM " +
					"t_stock_detail sdetail, t_stock_data sdata " +
				"WHERE " +
					"sdetail.stock_data_id=sdata.id " +
				"GROUP BY " +
					"sdata.stock_data_code " +
				"ORDER BY ssum DESC";
		
		return Db.find(sql);
	}
	
	/**
	 * 获取股票总收益
	 * @return
	 */
	public BigDecimal getMoneySum(){
		String sql = 
				"SELECT " +
					"SUM(ts.ssum) " +
				"FROM " +
					"(SELECT " +
						"sdata.`stock_data_code` scode, sdata.`stock_data_name` sname, SUM(sdetail.`stock_detail_num`*sdetail.`stock_detail_price`) ssum " +
					"FROM " +
						"t_stock_detail sdetail, t_stock_data sdata " +
					"WHERE " +
						"sdetail.`stock_data_id`=sdata.`id` " +
					"GROUP BY " +
						"sdata.`stock_data_code` " +
					"ORDER BY ssum DESC) ts " +
				"WHERE " +
					"ABS(ts.ssum) < 3000";
		
		return Db.queryBigDecimal(sql);
	}

}