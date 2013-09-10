<?php

class SchoolController extends BaseController
{
    public $modelClass = "InfoSchool";
    public $queryColumns = array('Province', 'City', 'SchoolName');

	public function __construct($id, $module)
	{
		parent::__construct($id, $module);
	    $this->buttons['create']['ajax'] = $this->buttons['update']['ajax'] = $this->buttons['view']['ajax'] = false;	
    }

    public function actionCreate()
    {
        $model = new InfoSchool;

        if (isset($_POST['InfoSchool']))
        {
            $fields = self::escapeFields($_POST['InfoSchool'], 
                array('SchoolName', 'Province', 'City', 'Address', 'Phone', 'Home', 'Email'));

            $fields['CreateTime'] = date('Y-m-d H:i:s', time());
            $fields['State'] = 0;
            $model->setAttributes($fields);

            if ($model->validate() && $model->save())
            {
                $this->redirect(array('view', 'SchoolID' => $model->getPrimaryKey()));
            }
        }

        $this->render('form', array(
                'model' => $model,
            ));

    }

    public function actionUpdate()
    {
        $schoolId = intval($_GET['SchoolID']);
        $model = InfoSchool::model()->findByPk($schoolId, "State = 0");
        if (empty($model))
        {
            throw new CHttpException(404);
        }

        if (isset($_POST['InfoSchool']))
        {
            $fields = self::escapeFields($_POST['InfoSchool'], 
                array('SchoolName', 'Province', 'City', 'Address', 'Phone', 'Home', 'Email'));
            $model->setAttributes($fields);

            if ($model->validate() && $model->save())
            {
                $this->redirect(array('view', 'SchoolID' => $model->getPrimaryKey()));
            }
        }

        $this->render('form', array(
                'model' => $model,
            ));
    }

    public function actionView()
    {
        $schoolId = intval($_GET['SchoolID']);
        $model = InfoSchool::model()->findByPk($schoolId, "State = 0");
        if (empty($model))
        {
            throw new CHttpException(404);
        }

        $this->render('view', array(
                    'model' => $model,
              ));
    }

    public static function escapeFields($params, $fields)
    {
        foreach ($fields as $fieldName)
        {
            if (isset($params[$fieldName]) && !empty($params[$fieldName]))
            {
                $params[$fieldName] = htmlspecialchars($params[$fieldName], ENT_QUOTES);
            }
        }

        return $params;
    }
}
