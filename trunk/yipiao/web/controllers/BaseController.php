<?php

/**
 * @desc cms所有Controller的基类
 * @author fox
 * @date 2011/05/23
 * @copyright slanissue
 */
class BaseController extends CController
{
	public $breadcrumbs=array();
	
	// public $layout = 'application.views.layouts.main';
	public $layout = 'application.views.layouts.content';
	
	// 指定数据表对应Model类
	public $modelClass = "";
	public $model = null;
	public $title = "";
	
	// 参数列所在的下标, 缺省都是第1列id, 订单需要使用订单号order_no
	public $argColIndex = 0;
	// 指定model中包含time的时间字段是否自动转化为int处理
	public $timeIsInt = true;
	
	// 列表表格缺省的宽度和高度
	public $width = 0;
	public $height = 370;
	// 每列的缺省宽度
	public $columnWidth = 70;
	
	// 弹出对话框缺省的宽度和高度
	public $dialogWidth = 400;
	public $dialogHeight = 300;
	
	// 缺省按钮列表
	public $defaultButtons = array('create', 'view', 'update', 'delete');
	
	/**
	 * @desc 按钮配置
	 * button_id(按钮id, 建议为action名称) => array(
	 * 		'name' => 显示名称,
	 * 		'class' => 显示图标,
	 * 		'window' => 窗口打开方式, 仅在ajax为false时有效, 取值有_self/_blank/_top
	 * 		'function' => 按钮单击调用函数, 仅在ajax为true时有效
	 * 		'ajax' => 交互方式: true 表示弹出对话框, false表示新打开页面
	 * )
	 */
	public $buttons = array('create' => array('name' 	=> '创建',
											  'class'   => 'icon-add',
											  'function' => 'newRow',
											  'ajax'	=> true
										),
							'view' 	 => array('name' 	=> '查看',
											  'class'   => 'icon-search',
											  'function' => 'viewRow',
											  'ajax'	=> true
										), 				
							'update' => array('name' 	=> '编辑',
											  'class'   => 'icon-edit',
											  'function' => 'editRow',
											  'ajax'	=> true
							 			),
							'delete' => array('name' 	=> '删除',
											  'class'   => 'icon-remove',
											  'function' => 'removeRow',
											  'ajax'	=> true
							 			),
							/*															
							'export' => array('name' 	=> '导出Excel',
											  'ajax'	=> true
										),
							*/
						);

	// 缺省过滤条件
	public $defaultCriteria = array('condition' => ''); // array('condition' => "State = 0");

	// 需要作为搜索的列字段
	public $queryColumns = array();

	// 显示的列字段: 设置时不允许设置部分, 必须设置全
	public $showColumns = array();
	
	// 不显示的列字段
	public $notShowColumns = array('update_time', 'create_time');

	/**
	 * datagrid的定制属性:
	 * array(
	 * 		'showFooter' => true/false,
	 * 		'rowStyler' => function,
	 * 		'loadFilter' => function,
	 * 		'view' => object,
	 * 	) 
	 */
	public $datagridConfig = array();
	
	/*
	 * 显示列的表格定制属性: array(name => array(
	 * 										'width' => 50,
	 * 										'hidden' => true/false,
	 * 										'sortable' => true/false,
	 * 										'align' => left/center/right,
	 * 									));
	 */
	public $columnShowConfig = array();

	/**
	 * 显示列的自定义属性: array(name => array(
	 * 										'editable' => true/false,
	 * 										'control'  => 'text/textarea/dropdown/date/datetime/upload',
	 * 										// value用于下拉选择框的选择列表
	 * 										'value' => array(id => name),
	 * 										// range为true表示为时间范围查询
	 * 										'range' => true/false,
	 * 										// 只有为range的时候有效，int表示时间字段类型为int值，datetime表示时间类型为datetime
	 * 										'type' => 'int/datetime', 
	 * 										'relation' => array('name' => 'role',
	 * 															'field' => 'name',
	 * 														)
	 *									));
	 */
	public $columnCustomConfig = array('id' => array('editable' => false));

	// 每页显示的默认记录条数
	public $rp = 10;

	// 增加$model->attributeLabels中未定义的表格列头
	public $addColumnHeaders = array();
	
	// 左边菜单名称
	public $menuName = '';

	public $systemCode = 'CMS';
	
	//如果需要渲染另外的视图文件就设置这个
	public $partialUrl = '';
	public $partialData = '';
	
	public function __construct($id, $module)
	{
		parent::__construct($id, $module);
		
		if (empty($this->model))
		{
			$modelClass = empty($this->modelClass)? ucfirst($this->getId()) : $this->modelClass;
			$this->model = new $modelClass;
			$this->modelClass = $modelClass;
		}
		
		if(!empty($this->module) && isset($this->module->menuName) && empty($this->menuName))
		{
		    $this->menuName = $this->module->menuName;
		}
	}

	/*
	public function filters()
	{
		return array(
					array('accessCommon.components.AccessFilter - data'),
				);
	}*/

	
	
	/**
	 * @desc 展示记录列表
	 *
	 */
	public function actionIndex()
	{		
		$columnNames = $this->model->attributeLabels();
		$columnNames += $this->addColumnHeaders;
		// print_r($columnNames);
		$showColumns = $this->getShowColumns();
		// print_r($showColumns);
		
		// 自动为button生成对应url
		foreach ($this->buttons as $key => &$value)
		{
			if (!$value['ajax'])	// 非ajax方式, 按照button的key格式化url
			{				
				if ($key == "create")
				{
					$value['url'] = $this->createUrl('create', $_GET);	
				}
				else if (($key == "view") || ($key == "update"))
				{
					$value['url'] = $this->createUrl($key, array_merge($_GET, array($showColumns[$this->argColIndex] => '')));
				}
				else 
				{
					$value['url'] = $this->createUrl($key, $_GET);
				}
			}
			else
			{
				$value['url'] = isset($value['url']) ? $value['url'] : $this->createUrl($key);
			}
		}
		
		$this->render('application.views.base.grid', array(
							'url'	=> $this->createUrl('data', $_GET),
							'width' => $this->width,
							'height' => $this->height,
							'dialogWidth' => $this->dialogWidth,
							'dialogHeight' => $this->dialogHeight,
							'columnWidth' => $this->columnWidth,
							'showColumns'  => $showColumns,
							'queryColumns' => $this->queryColumns,
							'columnNames'  => $columnNames,
							'buttons' => $this->buttons,
							'defaultButtons' => $this->defaultButtons,
							'title' => $this->title,
							'columnShowConfig' => $this->columnShowConfig,
							'columnCustomConfig' => $this->columnCustomConfig,
							'keyColumn' => $showColumns[$this->argColIndex],
							'params' => $_GET,
							'partialUrl' => $this->partialUrl,
							'partialData' => $this->partialData,
						));
	}

	/**
	 * @desc 获取需要展示的列字段列表
	 *
	 * @return array
	 */
	public function getShowColumns()
	{
		if (empty($this->showColumns))	// 显示列为空时默认显示全部
		{
			$columns = array_keys($this->model->attributeLabels());
		}
		else
		{
			$columns = $this->showColumns;
		}

		// 重新构造键名
		return array_values(array_diff($columns, $this->notShowColumns));
	}

	/**
	 * @desc 返回flexigrid需要的表格数据
	 * @param $_POST page/rp/sortname/sortorder optional
	 * @return json
	 */
	public function actionData()
	{
		$criteria = $this->defaultCriteria;
		unset($_GET['r']);
		if (!empty($_GET))
		{
			$this->setQueryParams($_GET, $criteria);
		}
		
		$page = self::setFlexigridParam($_POST, $criteria);
		if (!empty($_POST['search']))
		{
			$this->setQueryParams($_POST['search'], $criteria);
		}

		$data = array();
		$data['total'] = $this->model->count($criteria);
		$data['rows'] = array();

		$showColumns = $this->getShowColumns();
		// $keyColumnName = $showColumns[$this->argColIndex];
		// var_dump($keyColumnName);
		// print_r($criteria);
        
		$recordList = $this->model->findAll($criteria);

		foreach ($recordList as $index => $record)
		{
			$data['rows'][] = $this->formatValue($record, $showColumns);
		}
		
		$this->layout = true;
		$this->renderText(json_encode($data));
	}

	/**
	 * @desc 解析page/rp/sortname/sortorder合并到criteria中
	 *
	 * @param postInfo array
	 * @param criteria array OUT
	 * @return none
	 */
	public static function setFlexigridParam($postInfo, &$criteria)
	{
		$page = 1;
		$rp = 10;

		if (!empty($postInfo))
		{
			$page = isset($postInfo['page'])? intval($postInfo['page']) : 1;
			$rp = isset($postInfo['rows'])? intval($postInfo['rows']) : 10;
			$criteria['offset'] = ($page - 1) * $rp;
			$criteria['limit'] = $rp;

			if (isset($postInfo['sort']) && ($postInfo['sort'] != 'undefined'))
			{
				$sortOrder = (isset($postInfo['order']) && ($postInfo['order'] != 'undefined'))? $postInfo['order'] : "asc";
				$criteria['order'] = $postInfo['sort'] . " " . $sortOrder;
			}
		}

		return $page;
	}

	/**
	 * @desc 根据查询条件构造criteria
	 *
	 * @param postFields array
	 * @param criteria CDbCriteria OUT
	 * @return none
	 */
	public function setQueryParams($postFields, &$criteria)
	{
		$condition = "";
		$first = true;
		$tableSchema = $this->model->getTableSchema();
		
		foreach ($postFields as $name => $value)
		{
			if ($value === "")
			{
				continue;
			}

			if (is_array($value))	// value为数组, 表示区间查询>= <=
			{
				// print_r($value);
				if (empty($value[0]) && empty($value[1]))	// 同时都为空表明没有选择
				{
					continue;	
				}
				
				$begin = empty($value[0])? 0 : strtotime($value[0]);
				$end = empty($value[1])? 0 : strtotime($value[1]);
				if ($this->columnCustomConfig[$name]['control'] == 'date') // 选择日期则往后挪一天
				{
					$end += 86400;	
				}
				if ($this->columnCustomConfig[$name]['type'] == 'datetime')
				{
					$begin = date('Y-m-d H:i:s', $begin);
					$end = date('Y-m-d H:i:s', $end);
				}
				
				if (!$first)
				{
					$condition .= " and ";
				}
				$condition .= " ${name} >= '" . $begin . "' and ${name} <= '" . $end . "' ";
				$first = false;
			}
			else
			{
				if (!$first)
				{
					$condition .= " and ";
				}
				$first = false;
				
				$columnSchema = $tableSchema->getColumn($name);
				// var_dump($columnSchema->dbType);
				// var_dump($columnSchema->type);
				if ($columnSchema->type == "integer")
				{
					$condition .= " ${name} = ${value} ";
				}
				else // 非整型全部采用模糊查询
				{
					$condition .= $name . " like '%" . $value . "%' ";
				}

			}
		}

		// var_dump($condition);
		if (!empty($condition))
		{
			$criteria['condition'] .= (!empty($criteria['condition'])? " and " : "") . $condition;
		}

		return $criteria;
	}

	/**
	 * @desc 处理删除操作
	 * @param items 以逗号分隔的id列表
	 * @return json array('total' => $total)
	 */
	public function actionDelete()
    {
        $showColumns = $this->getShowColumns();
        $keyColumnName = $showColumns[$this->argColIndex];

		$id = $_POST[$keyColumnName];
		$this->model->updateByPk($id, array("State" => '1'));

		$this->layout = false;
		$this->renderText(json_encode(array('success' => true)));
	}
	
	/**
	 * @desc 处理导出excel的操作
	 * @param $_POST['headers'] $_POST['rows']
	 * @return 
	 */
	public function actionExport()
	{
		// 由前端遍历当前页所有记录post上来，php里调用PHPExcel创建excel的worksheet,
		$excel = ExcelExport::getInstance();
		$excel->setTemplate();
		
		$columns = explode(",", $_POST['headers']);
		$info = explode("|", $_POST['rows']);
		foreach ($info as $elem)
		{
			$row = explode(",", $elem);
			$rows[] = $row;
		}
		// print_r($columns);
		// print_r($rows);
		
		$excel->render($rows, $columns);
		$excel->download();
	}

	/*
	 * @desc 导出符合条件的所有记录
	 * @param $_POST['search']
	 */ 
	public function actionExportAll()
	{
		$criteria = $this->defaultCriteria;
		unset($_GET['r']);
		if (!empty($_GET))
		{
			$this->setQueryParams($_GET, $criteria);
		}
		
		if (!empty($_POST['search']))
		{
			$this->setQueryParams($_POST['search'], $criteria);
		}
		// print_r($criteria);exit;
		
		$showColumns = $this->getShowColumns();
		$columnNames = $this->model->attributeLabels();
		foreach ($showColumns as $name)
		{
			$columns[] = $columnNames[$name];
		}

		$rows = array();
		$recordList = $this->model->findAll($criteria);

		foreach ($recordList as $record)
		{
			$row = $this->formatValue($record, $showColumns);
			$rows[] = $row;
		}
		
		$excel = ExcelExport::getInstance();
		$excel->setTemplate();
		$excel->render($rows, $columns);
		$excel->download();
	}
	
	/**
	 * @desc 对数据进行格式化以便显示
	 * @param record CActiveRecord instance
	 * @param showColumns array 显示字段列表
	 * @return array
	 */
	public function formatValue($record, $showColumns)
	{
		$result = array();

		foreach ($showColumns as $key)
		{
			$value = $record->$key;

			if (strstr($key, "_time") && $this->timeIsInt)	// 字段为整型的时间
			{
				$result[$key] = date('Y-m-d H:i:s', $value);
			}
			else if (isset($this->columnCustomConfig[$key]))	// 设置了自定义属性
			{
				if (isset($this->columnCustomConfig[$key]['relation']))	// 设置了关联对象
				{
					$relationObject = $record->getRelated($this->columnCustomConfig[$key]['relation']['name']);					
					$result[$key] = $relationObject[ $this->columnCustomConfig[$key]['relation']['field'] ];						
				}
				else if ($this->columnCustomConfig[$key]['control'] == "dropdown")	// dropdown传入的value为array(id => name)
				{
					// var_dump($key);
					// var_dump($value);
					// print_r($this->columnCustomConfig[$key]['value']);
					$result[$key] = $this->columnCustomConfig[$key]['value'][$value];
				}
				else if (isset($this->columnCustomConfig[$key]['user_function']))
				{
				    $uf = $this->columnCustomConfig[$key]['user_function'];
				    $args = isset($uf['args']) ? $uf['args'] : array();
				    $args = is_array($args) ? $args : array($args);
				    //var_dump($uf);
				    $result[$key] = call_user_func_array($uf['function'], array_merge(array($value), $args));
				}
				else
				{
					$result[$key] = $value;
				}
			}
			else
			{
				$result[$key] = $value;
			}
		}
		
		return $result;
	}

	/**
	 * @desc 对提交的数据处理
	 *
	 * @param postFields array
	 * @return array
	 */
	public function renderValue($postFields)
	{
		$result = array();

		foreach ($postFields as $name => $value)
		{
			if (isset($this->columnCustomConfig[$name]) && ($this->columnCustomConfig[$name]['editable'] === false))
			{
				continue;
			}
            
			if ($this->timeIsInt && strstr($name, "time"))
			{
				$result[$name] = strtotime($value);
			}
			else
			{
				$result[$name] = $value;
			}
		}

		return $result;
	}
	
}
?>
