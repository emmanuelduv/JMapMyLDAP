<?php
/**
 * PHP Version 5.3
 *
 * @package     Shmanic.Components
 * @subpackage  Shconfig
 * @author      Shaun Maunder <shaun@shmanic.com>
 *
 * @copyright   Copyright (C) 2011-2013 Shaun Maunder. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Items view class for Shconfig.
 *
 * @package     Shmanic.Components
 * @subpackage  Shconfig
 * @since       2.0
 */
class ShconfigViewItems extends JViewLegacy
{
	protected $items = null;

	protected $pagination = null;

	protected $state = null;

	/**
	 * Method to display the view.
	 *
	 * @param   string  $tpl  A template file to load. [optional]
	 *
	 * @return  mixed  A string if successful, otherwise a JError object.
	 *
	 * @since   2.0
	 */
	public function display($tpl = null)
	{
		$this->items = $this->get('Items');
		$this->pagination = $this->get('Pagination');
		$this->state = $this->get('state');

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JError::raiseError(500, implode("\n", $errors));
			return false;
		}

		parent::display($tpl);
		$this->addToolbar();
	}

	/**
	 * Method to configure the toolbar for this view.
	 *
	 * @return  void
	 *
	 * @since   2.0
	 */
	protected function addToolbar()
	{
		$state	= $this->get('State');
		$canDo	= ShconfigHelper::getActions();

		JToolBarHelper::title(JText::_('COM_SHCONFIG_MANAGER_ITEMS'), '');
		if ($canDo->get('core.edit') || $canDo->get('core.admin'))
		{
			JToolBarHelper::addNew('item.add');
			JToolBarHelper::editList('item.edit');

			JToolBarHelper::deleteList('', 'items.delete');
			JToolBarHelper::divider();

			if ($canDo->get('core.admin'))
			{
				JToolBarHelper::preferences('com_shconfig');
			}
		}
	}

}
