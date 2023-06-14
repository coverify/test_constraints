import esdl;
import std.stdio;

class queueObj
{
  enum OP: ubyte {
    REMOVE_FRONT_ONE,
    REMOVE_BACK_ONE,
    REMOVE_ONE,
    REMOVE_FRONT,
    REMOVE_BACK,
    REMOVE,
    INSERT,
    PUSH_BACK,
    PUSH_FRONT,
    INSERT_ONE,
    PUSH_BACK_ONE,
    PUSH_FRONT_ONE,
  }
  
  mixin randomization;

  Queue!ubyte _queue;

  @rand ubyte[] _arr;
  @rand uint _len;
  @rand ubyte _elem;

  @rand uint _pos;

  uint _lenMax = 10;

  this (uint maxLen) {
    _lenMax = maxLen;
  }

  constraint!q{
    _len <= _lenMax;
    _len > 0;
    _arr.length == _len;
  } cst_len;

  @rand OP _op;

  constraint!q{
    if (_queue.length == 0) {
      _op >= OP.INSERT;
    }
    if (_queue.length > _lenMax) {
      _op <= OP.REMOVE;
    }
    _pos <= _queue.length;

    if (_op <= OP.REMOVE) {
      _pos + _len <= _queue.length;
    }
  } cst_q;

  Queue!ubyte _start;

  void check(ubyte[] exp) {
    if (_queue != exp) {
      import std.stdio;
      writefln("%s : %s : %s : %s : %s \n %s !=\n %s", _start, _op, _pos, _len, _arr,
	       exp, _queue);
      _start.print();
      _queue.print();
      assert(false);
    }
  }

  void post_randomize() {
    ubyte[] arr = _queue.toArray();
    _start = _queue.clone();
    final switch (_op) {
    case OP.REMOVE_FRONT_ONE:
      _queue.popFront();
      check(arr[1..$]);
      break;
    case OP.REMOVE_BACK_ONE:
      _queue.popBack();
      check(arr[0..$-1]);
      break;
    case OP.REMOVE_ONE:
      _queue.remove(_pos, 1);
      check(arr[0.._pos] ~ arr[_pos+1..$]);
      break;
    case OP.REMOVE_FRONT:
      _queue.removeFront(_len);
      check(arr[_len..$]);
      break;
    case OP.REMOVE_BACK:
      _queue.removeBack(_len);
      check(arr[0..$-_len]);
      break;
    case OP.REMOVE:
      _queue.remove(_pos, _len);
      check(arr[0.._pos] ~ arr[_pos+_len..$]);
      break;
    case OP.INSERT:
      _queue.insert(_pos, _arr);
      check(arr[0.._pos] ~ _arr ~ arr[_pos..$]);
      break;
    case OP.PUSH_BACK:
      _queue.pushBack(_arr);
      check(arr ~ _arr);
      break;
    case OP.PUSH_FRONT:
      _queue.pushFront(_arr);
      check(_arr ~ arr);
      break;
    case OP.INSERT_ONE:
      _queue.insert(_pos, _elem);
      check(arr[0.._pos] ~ _elem ~ arr[_pos..$]);
      break;
    case OP.PUSH_BACK_ONE:
      _queue.pushBack(_elem);
      check(arr ~ _elem);
      break;
    case OP.PUSH_FRONT_ONE:
      _queue.pushFront(_elem);
      check([_elem] ~ arr);
      break;
    }
  }
}

void main()
{
  queueObj test = new queueObj(10);
  for (size_t i=0; i!=1000; ++i) {
    test.randomize();
  }
  test._queue.print();
}
