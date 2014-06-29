<?php

/**
 * 导出Excel 类
 *
 * @author Sky <divein@126.com>
 * @license slanissue
 * @package Common
 * @version $Id: ExcelExport.php 31809 2013-01-14 08:49:30Z fox $
 */
$extensionPath = Yii::getPathOfAlias('ext');
require_once $extensionPath . '/PHPExcel.php';
require_once $extensionPath . '/PHPExcel/IOFactory.php';

/**
 * Excel 数据导出类
 *
 * 基本使用方法：
 *  <pre>
 *    $x = ExcelExport::getInstance();
 *    $x->setTemplate();  //可传入模板参数，模板在 /protected/views/excel下，默认模板为standard.xslx
 *    //列头数据
 *    $columns = array('column1','column2','column3');
 *    // 数据
 *    $data = array(array('Excel for dummies',
 * 	 				 17.99,
 * 	 				 2
 * 	 			   ),
 * 	 		  array('PHP for dummies',
 * 	 				 15.99,
 * 	 				 1
 * 	 			   ),
 * 	 		  array( 'Inside OOP',
 * 	 				 12.95,
 * 					 1
 * 	 		  )
 * 	 );
 *   //渲染
 *   $x->render($data,$columns);
 *   // 下载,excel后缀名(xslx)可选。
     $x->download('excel文件名称');
 * </pre>
 */
class ExcelExport {

    const COL_BEGIN      = 65;   //'A'-'Z','AA','AB'... -- ...'ZY','ZZ'
    const COL_END        = 741;

    private $excelObj = null;
    private $readerObj = null;
    public  $title = '';
    public  $subject = '';
    public  $description = '';
    public  $keywords = '';
    public  $category = '';
    public  $defaultFileName = 'bevaexcel.xlsx';
    /**
     * 获得对象实例的单例方法
     */
    public static function getInstance() {
        static $obj;
        if (isset($obj)) {
            return $obj;
        } else {
            $obj = new ExcelExport();
            $obj->init();
            return $obj;
        }
    }

    public function init() {
        $this->excelObj = new PHPExcel();
        $this->readerObj = PHPExcel_IOFactory::createReader('Excel2007');
    }

    /**
     * 设置导出数据模板
     */
    public function setTemplate($template='standard.xlsx') {
        $path = Yii::getPathOfAlias('application.views.excel');
        $templatefile = $path . '/' . $template;
        if (!file_exists($templatefile)) {
            throw new CException('模板文件不存在');
        }
        $this->excelObj = $this->readerObj->load($templatefile);
    }

    /**
     * 根据给出的参数 对excel 进行渲染
     * 使用自定义列头使用方法:
     * <pre>
     *  $columns = array('column1','column2','column3');
     *  $data = array(array('Excel for dummies',
	 *				 17.99,
	 *				 2
	 *			   ),
	 *		  array('PHP for dummies',
	 *				 15.99,
	 *				 1
	 *			   ),
	 *		  array( 'Inside OOP',
	 *				 12.95,
	 *				 1
	 *		  )
	 *		 );
     *  $excelExport->render($data,$columns);
     * </pre>
     *
     * 使用关联数组索引作为列值使用方法:
     *
     * <pre>
     *  $data = array(array('title'		=> 'Excel for dummies',
	 *				'price'		=> 17.99,
	 *				'quantity'	=> 2
	 *			   ),
	 *		  array('title'		=> 'PHP for dummies',
	 *				'price'		=> 15.99,
	 *				'quantity'	=> 1
	 *			   ),
	 *		  array('title'		=> 'Inside OOP',
	 *				'price'		=> 12.95,
	 *				'quantity'	=> 1
	 *			   )
	 *	  );
     *  $excelExport->render($data);
     * </pre>
     *
     * @param array $columns 写入的列信息
     * @param array $data    要写入的数据
     * @param boolean $ascArray 是否传入的是关联数组（如果传入的是关联数组，
     */
    public function render($data=null,$columns=null,$ascArray = true){
        // 从数组里抽取列名称
        if(empty($columns) && $ascArray){
           if(!empty($data[0])){
               $columns  = array_keys($data[0]);
           }
        }

		if(!empty($columns))
		{
			if(count($columns) > (self::COL_END - self::COL_BEGIN ))
			{
				throw new CException('传入的列大于Excel支持的最大列数.');
			}
			
			$baseCol = self::COL_BEGIN;
			
			foreach((array)$columns as $k => $v)
			{
				//如果列数在26列内，则为A-Z,超过了26位，则为[A-z] . [A-Z],配置中只允许两位字母的列数
				$col = $baseCol + $k;
				$column = $this->getCellHead($col);

				$this->excelObj->getActiveSheet()->setCellValueExplicit($column . '1', $v,PHPExcel_Cell_DataType::TYPE_STRING);
				$this->excelObj->getActiveSheet()->getStyle($column)->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
			}
       }

   //    $this->excelObj->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);   
	
       
       // 写入数据信息
       $baseRow = empty($columns) ? 1 : 2;
       // 列计数(因为有可能$data是hash数组，所以用$c来计数
       $c = 0;
       foreach((array)$data as $k => $v){
           $row = $baseRow + $c;
           $c ++;

           $cc = 0; //因为可能是关联数组，这里单独一个$cc 来计数
           foreach($v as $value)
           {
				$col = self::COL_BEGIN + $cc;
				//获得该列的标头
				$column = $this->getCellHead($col);
				
				$cc ++;
				$this->excelObj->getActiveSheet()->setCellValueExplicit($column.$row, $value, PHPExcel_Cell_DataType::TYPE_STRING);
           }
       }
    }

    /**
     * 设置excel 属性
     */
    public function setProperties($property) {
        $this->title = isset($property['title']) ? $property['title'] : $this->tilte;
        $this->subject = isset($property['subject']) ? $property['subject'] : $this->subject;
        $this->description = isset($property['description']) ? $property['description'] : $this->description;
        $this->keywords = isset($property['keywords']) ? $property['keywords'] : $this->keywords;
        $this->category = isset($property['category']) ? $property['category'] : $this->category;

        $this->excelObj->getProperties()->setCreator("芝兰玉树")
                ->setLastModifiedBy("芝兰玉树")
                ->setTitle($this->title)
                ->setSubject($this->subject)
                ->setDescription($this->description)
                ->setKeywords($this->keywords)
                ->setCategory($this->category);
    }

    /**
     * 导出Excel
     *
     * @param  $filename 导出的文件名
     */
    public function download($filename='bevaexcel.xlsx') {
        if(strpos($filename,'.xlsx') == false){
            $filename .= '.xlsx';
        }
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="'.$filename.'"');
        header('Cache-Control: max-age=0');
        $objWriter = PHPExcel_IOFactory::createWriter($this->excelObj, 'Excel2007');
        $objWriter->save('php://output');
    }

   public function download2($filename='bevaexcel.xlsx') {
        if(strpos($filename,'.xlsx') == false){
            $filename .= '.xlsx';
        }
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="'.$filename.'"');
        header('Cache-Control: max-age=0');
        $objWriter = PHPExcel_IOFactory::createWriter($this->excelObj, 'Excel2007');
		  
	 }	
    /**
     * 把excel保存在指定文件路径
     *
     * @param $filepath 保存的文件路径
     */
    public function saveTo($filepath) {
       	$objWriter = PHPExcel_IOFactory::createWriter($this->excelObj, 'Excel2007');
        $objWriter->save($filepath);
    }
    
    /**
     * 根据传入相应的ascii码对应的十进制数字的值得到对应的在excel中列头字母标识。
     * 说明：如果列数在26列内，则为A-Z,超过了26位，则为[A-z] . [A-Z],配置中只允许两位字母的列数
     *
     * @param integer $col ascii码对应的十进制数字的值
     * @return string 对应的在excel中列头字母标识
     */
    private function getCellHead($col)
    {
    	//得到第二位的字母
		$lastInt = ($col - ord("A")) % (ord("Z") - ord("A") + 1) + ord("A");
		$lastChar = chr($lastInt);
		
		//得到第一位的字母
		$firstInt = floor(($col - ord("A")) / (ord("Z") - ord("A") + 1));
		$firstChar = ($firstInt == 0) ? '' :  chr(ord("A") + ($firstInt - 1));
		
		//得到整个列的
		$column = $firstChar . $lastChar;
		
		return $column;
    }
}