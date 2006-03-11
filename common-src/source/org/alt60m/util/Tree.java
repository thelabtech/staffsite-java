package org.alt60m.util;

import java.util.*;

public class Tree {

    private ArrayList _trunk;
    private ArrayList _currentBranch;
    private TreeElement _currentElement;
    private int _pointer;
    private int _treeSize;

    public Tree() {
	_trunk = new ArrayList();
	_currentBranch = _trunk;
	_pointer = 0;
	_treeSize = 0;
    }

    public void addLeaf(Object o) {
	//adds leaf to end of current branch
	_currentElement = new TreeElement(o);
	_currentBranch.add(_currentElement);
	_pointer = _currentBranch.size() - 1;
	_treeSize++;
    }

    public Object pointer() {
	//returns leaf at the pointer
	return ((TreeElement) _currentBranch.get(_pointer)).getLeaf();
    }

    public int branchSize() {
	// returns the number of leaves on the current branch -- probably need a recursive and non-recursive one
	return _currentBranch.size();
    }

    public void removeLeaf() {
	// removes current leaf from branch
	// could also have a remove leaves that would remove x number of leaves starting with the current one
	_currentBranch.remove(_pointer);
	_treeSize--;
    }

    public void addBranch(List l) {
	//add branch to  current leaf
	_currentElement.setBranch(l);
    }

    public boolean  hasBranch() {
	// returns true if a branch starts here
	try {
	    List b = _currentElement.getBranch();
	    if (b != null) {
		return true;
	    } else {
		return false;
	    }
	} catch (NullPointerException e) {
	    return false;
	}
    }

    public void prune() {
	//removes current branch and all it's sub elements (leaves and branches)
	_currentElement.setBranch(null);
    }

    public void followBranch() {
	// directs pointer to follow the branch and leave the trunk
	_currentBranch = (ArrayList) _currentElement.getBranch();
    }

    public boolean hasNext() {
	// returns true if there is another leaf on this branch
	if (_pointer + 1 <= _currentBranch.size() - 1) {
	    return true;
	} else {
	    return false;
	}
    }

    public Object next() {
	 // returns the next leaf of current branch and moves the pointer forward -- probably be good to accept an int to move x number of leaves
	_pointer++;
	return pointer();
    }

    public boolean hasPrevious() {
	 //returns true if there is another leaf before current on this branch
	if (_pointer - 1 >= 0) {
	    return true;
	} else {
	    return false;
	}
    }

    public Object previous() {
	 // returns the previous leaf of the current branch and moves the pointer backward -- probably be good to accept an int to move x number of leaves
	_pointer--;
	return pointer();
    }

    public Object first() {
	 // moves to first leaf of the branch and returns that leaf
	_pointer = 0;
	return pointer();
    }

    public Object last() {
	 // moves to last leaf of the branch
	_pointer = _currentBranch.size() - 1;
	return pointer();
    }

    public int treeSize() {
	 // returns the number of leaves on the tree
	return _treeSize;
    }

    public void newBranch() {
	//creates a new branch at current pointer and makes it current
	_currentBranch = new ArrayList();
	_currentElement.setBranch(_currentBranch);
    }

    public void insertLeafBefore(Object o) {
	/*NEEDS TEST*/
	//inserts leaf before current leaf
	// should pointer be on new one or old one?
	_currentElement = new TreeElement(o);
	_currentBranch.add(_pointer, _currentElement);
	_treeSize++;
    } 

    public void insertLeafAfter(Object o) {
	/*NEEDS TEST*/
	//inserts leaf after current leaf
	// for add after, monkey with the pointer
	_currentElement = new TreeElement(o);
	_currentBranch.add(_pointer + 1, _currentElement);
	_treeSize++;
    } 


    public void addLeaves() {} //adds bunch of children from array, iterator, enumeration
    public void graft() {} // moves current branch and all it's sub elements (leaves and branches)
    public void mark() {} // sets a bookmark to quickly return to this spot
    public void jump() {} // sets the pointer to the leaf marked by the marker
    public void unmark() {} //clears the bookmark

    // not sure if i'll imple
    public void elements() {} //returns all the leaves flattened into one iterator?
    public void leaves() {} // returns iterator of leaves of the current branch


}


 class TreeElement {

    private Object _leaf;
    private ArrayList _branch;

    public TreeElement() {}

    public TreeElement(Object o) {
	_leaf = o;
    }

    public TreeElement(Object o, List l) {
	_leaf = o;
	_branch = (ArrayList) l;
    }

    public void setLeaf(Object o) {
	_leaf = o;
    }

    public void setBranch(List l) {
	_branch = (ArrayList) l;
    }

    public Object getLeaf() {
	return _leaf;
    }

    public List getBranch() {
	return _branch;
    }
}
