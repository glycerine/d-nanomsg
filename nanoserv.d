import nanomsg;
import core.stdc.stdio;
import core.stdc.string;
import std.string;
import std.stdio;
import std.conv;

// ==================================
// ==================================
// nanoserv.d 
// ==================================
// ==================================



int main ()
{
  int sb;
  int i;
  char buf [4];
  int opt;
  size_t sz;
  char* pRecvd;

  immutable char* SOCKET_ADDRESS = "tcp://127.0.0.1:5555".ptr;


  // client, running on windows

  auto sc = nn_socket (AF_SP, NN_PAIR);
  assert (sc >= 0);
  writefln("nn_socket returned: %d", sc);

  // bind
  auto rc = nn_bind (sc, cast(char*)SOCKET_ADDRESS);
  assert (rc > 0);


  // receive
  rc = nn_recv (sc, &pRecvd, NN_MSG, 0);
  assert (rc >= 0);
  assert (rc == 3); // nn_assert

  string r = to!string(pRecvd);
  writefln("server: I received a %d byte msg: '%s'", rc, r);


  // send
  memcpy(buf, "LUV\0".ptr, 4);
  rc = nn_send (sc, buf, 3, 0);
  printf("server: I sent '%s'\n", buf);
  assert (rc >= 0);
  assert (rc == 3); // nn_assert


  // free
  rc = nn_freemsg(pRecvd);
  assert (rc == 0);

  // close
  rc = nn_close (sc);
  assert (rc == 0);

  return 0;
}
