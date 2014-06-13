<?php

Yii::import('admin.models.InfoUser');

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
    private $uid;
	
	/**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
		$userRecord = NULL;
		if (strlen ( $this->username ) != 11 || ! preg_match ( '/^1[3|4|5|7|8][0-9]\d{4,8}$/', $this->username ))
		{
			if (filter_var ($this->username, FILTER_VALIDATE_EMAIL )) {  
				$userRecord = InfoUser::model()->findByAttributes(array('Email' => $this->username, 'State' => 1),"left(right(Verify,2),1) = '1'");
			}else 
				$userRecord = InfoUser::model()->findByAttributes(array('UserName' => $this->username, 'State' => 1));
		}else 
			$userRecord = InfoUser::model()->findByAttributes(array('Phone' => $this->username, 'State' => 1),"left(right(Verify,1),1) = '1'");
        	
        if (empty($userRecord))
        {
			$this->errorCode=self::ERROR_USERNAME_INVALID;
        }
        else if($userRecord->Pwd !== $this->password) // if($userRecord->Pwd !== md5($this->password))
        {
			$this->errorCode=self::ERROR_PASSWORD_INVALID;
        }
		else
        {
			$this->errorCode=self::ERROR_NONE;
            $this->uid = $userRecord->UID;
            $this->username = $userRecord->UserName;

            $userInfo = AdminUtil::loadUserSessionInfo($userRecord->UID);
            foreach ($userInfo as $key => $value)
            {
                Yii::app()->session[$key] = $value;
            } 
        }
		return !$this->errorCode;
	}

    public function getId()
    {
        return $this->uid;
    }
    
}
