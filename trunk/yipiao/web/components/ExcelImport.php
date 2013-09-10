<?php
/**
 * 导出Excel 类,支持 支持excel 2007格式的数据导入
 *
 * 通过配置数组， 获得excel中指定范围数据，并根据配置信息中 columnNames设置，设置返回数组的key
 * 如果配置信息里没有指定 columnNames ，则默认使用excel中第一行的列头做为关联数组的key
 * 配置中 rangeCol 标识列取值范围，和excel不一样，这里索引从0开始，0标识第一列， 字符串'highest' 表示使用数据列的最大列
 *  rangeRow 同上， 默认行从第二行开始读取数据。
 * 例子：
 * <pre>
 *   $x = ExcelImport::getInstance();
 *   //这里也可以不指定配置，和列值，默认会读取excel第一列的内容
 *   // $x->init();
 *   $x->init(array('columnNames'=>array('col1','col2','col3','col4','col5'),'rangeRow'=>array(5,'highest')));;
 *   $x->load(Yii::getPathOfAlias('application.views.excel').'\example.xlsx');
 *   $x->getValues();
 * </pre>
 * @author Sky <divein@126.com>
 * @license slanissue
 * @package Common
 * @version $Id: ExcelImport.php 27345 2012-10-15 06:37:51Z kennethfan $
 */


require_once Yii::getPathOfAlias('ext') . '/PHPExcel.php';
require_once Yii::getPathOfAlias('ext') . '/PHPExcel/IOFactory.php';

/**
 * Excel 导入类，支持excel 2007格式的导入.
 *
 */
class ExcelImport{
    private $excelObj = null;
    private $readerObj = null;

    public $config = array(
        'columnNames'   => array(),        // 导入列名列表
        'ingoreColumn'  => array(),        // 忽略读取的列
        'keyFromHeader'=> true,            //如果columnNames 为空，尝试从表格header 生成key
        'rangeCol' =>array(0,'highest'),   //读取的列范围 ,highest 表示列最大范围
        'rangeRow' =>array(1,'highest'),   //读取的行范围， highest 表示行最大范围
    );

    /**
    * 获得对象实例的单例方法
    */
    public static function getInstance() {
        static $obj;
        if (isset($obj)) {
            return $obj;
        } else {
            $obj = new ExcelImport();
            return $obj;
        }
    }

   /**
    *  配置初始化
    *
    * @param type $config
    */
    public function init($config = null){
       if(!empty($config)){
           $this->config = array_merge($this->config,$config);
       }
       $this->excelObj = new PHPExcel();
       $this->readerObj = PHPExcel_IOFactory::createReader('Excel2007');
    }
    /**
     * 载入excel文件
     *
     * @param string $excel excel文件完成路径
     */
    public function load($excel){
        $this->excelObj = $this->readerObj->load($excel);
    }

    /**
     * 获得excel数据
     *
     */
    public function getValues(){
       $objWorksheet = $this->excelObj->getActiveSheet();
       // 最高行
       $highestRow =   ($this->config['rangeRow'][1]=='highest') ? $objWorksheet->getHighestRow() : $this->config['rangeRow'][1] ;
       // 最高列
       $highestColumn =($this->config['rangeCol'][1]=='highest') ?  PHPExcel_Cell::columnIndexFromString($objWorksheet->getHighestColumn()) : $this->config['rangeRow'][1];

       $columnNames = array();
       if(empty($this->config['columnNames']) && $this->config['keyFromHeader']){
           for ($col = $this->config['rangeCol'][0]; $col < $highestColumn; $col++) {
              $columnNames[] = $objWorksheet->getCellByColumnAndRow($col,1)->getValue();
           }
           $this->config['columnNames'] = $columnNames;
       }
     $objWorksheet->getCellByColumnAndRow($i,$row)->getValue();
       // 读取数据
       $data = array();
       for($row = $this->config['rangeRow'][0],$index=0; $row < $highestRow; $row++,$index++){
         for($i =$this->config['rangeCol'][0]; $i< $highestColumn; $i++){
             if(in_array($this->config['columnNames'][$i], $this->config['ingoreColumn'])){
                 continue;
             }
             $data[$index][$this->config['columnNames'][$i]] = $objWorksheet->getCellByColumnAndRow($i,$row+1)->getValue();
         }
       }
       return $data;
    }
    
    /**
     * @desc 获得EXCEL某一行的数据
     *
     * @param integer $rowIndex
     * @return array 
     */
    public function getRowValue($rowIndex)
    {
    	$baseFileInfo = $this->getBaseParams();
    	
    	//获取最大行，最大列
//    	list($highestRow, $highestColumn, $lowestRow, $lowestColumn) = $baseFileInfo;
    	$highestRow = $baseFileInfo['highestRow'];
    	$highestColumn = $baseFileInfo['highestColumn'];
    	
    	//如果给定的行数小于EXCEL最小行或者大于EXCEL最大行，忽略
    	if($rowIndex < $this->config['rangeRow'][0] || $rowIndex > $highestRow)
    	{
    		echo "{$rowIndex}超过文件最大行。\n";
    		exit(1);
    	}
    	$objWorksheet = $this->excelObj->getActiveSheet();
    	
    	if(empty($this->config['columnNames']) && $this->config['keyFromHeader'])
    	{
    		$columnNames = array();
    		
    		for($col = $this->config['rangeCol'][0]; $col < $highestColumn; $col++)
    		{
				$columnNames[] = $objWorksheet->getCellByColumnAndRow($col,1)->getValue();
			}
			
			$this->config['columnNames'] = $columnNames;
    	}
    	
    	$data = array();
    	//读取数据
    	for($col = $this->config['rangeCol'][0]; $col < $highestColumn; $col++)
    	{
    		if(in_array($this->config['columnNames'][$col], $this->config['ingoreColumn']))
    		{
    			continue;
    		}
    		
    		$data[$this->config['columnNames'][$col]] = $objWorksheet->getCellByColumnAndRow($col, $rowIndex + 1)->getValue();
    	}
    	
    	return $data;
    }
    
    /**
     * @desc 获取EXCEL文件基本信息，最大行数和最大列数
     *
     * @return array
     */
    public function getBaseParams()
    {
    	$objWorksheet = $this->excelObj->getActiveSheet();
    	
    	//最高行
    	$highestRow = ($this->config['rangeRow'][1] == 'highest') ? $objWorksheet->getHighestRow() : $this->config['rangeRow'][1];
    	
    	//最高列
    	$highestColumn = ($this->config['rangeCol'][1] == 'highest') ? PHPExcel_Cell::columnIndexFromString($objWorksheet->getHighestColumn()) : $this->config['rangeRow'][1];
    	
    	return array('highestRow' => $highestRow, 'highestColumn' => $highestColumn, 'lowestRow' => $this->config['rangeRow'][0], 'lowestColumn' => $this->config['rangeCol'][0]);
    }
}
