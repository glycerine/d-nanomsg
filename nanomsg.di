// ======================================
// nanomsg.di : nanomsg bindings for D
//
// ======================================


 const static ulong AF_SP = 1;
 const static ulong AF_SP_RAW = 2;
 const static ulong NN_CHUNKREF_MAX = 32;
 const static ulong NN_DOMAIN = 12;
 const static ulong NN_DONTWAIT = 1;
 const static ulong NN_FSM_ACTION = -2;
 const static ulong NN_FSM_START = -2;
 const static ulong NN_FSM_STOP = -3;
 const static ulong NN_HAUSNUMERO = 156384712;
 const static ulong NN_INPROC = -1;
 const static ulong NN_IPC = -2;
 const static ulong NN_IPV4ONLY = 14;
 const static ulong NN_LINGER = 1;
 const static ulong NN_PIPEBASE_PARSED = 2;
 const static ulong NN_PIPEBASE_RELEASE = 1;
 const static ulong NN_PIPE_IN = 33987;
 const static ulong NN_PIPE_OUT = 33988;
 const static ulong NN_PIPE_PARSED = 2;
 const static ulong NN_PIPE_RELEASE = 1;
 const static ulong NN_PROTO_BUS = 7;
 const static ulong NN_PROTOCOL = 13;
 const static ulong NN_PROTO_PAIR = 1;
 const static ulong NN_PROTO_PIPELINE = 5;
 const static ulong NN_PROTO_SUB = 2;
 const static ulong NN_PROTO_REQREP = 3;
 const static ulong NN_PROTO_SURVEY = 6;
 const static ulong NN_RCVBUF = 3;
 const static ulong NN_RCVFD = 11;
 const static ulong NN_RCVTIMEO = 5;
 const static ulong NN_RECONNECT_IVL = 6;
 const static ulong NN_RECONNECT_IVL_MAX = 7;
 const static ulong NN_REQ_RESEND_IVL = 1;
 const static ulong NN_SNDBUF = 2;
 const static ulong NN_SNDFD = 10;
 const static ulong NN_SNDPRIO = 8;
 const static ulong NN_SNDTIMEO = 4;
 const static ulong NN_SOCKADDR_MAX = 128;
 const static ulong NN_SOCKBASE_EVENT_IN = 1;
 const static ulong NN_SOCKBASE_EVENT_OUT = 2;
 const static ulong NN_SOCKTYPE_FLAG_NORECV = 1;
 const static ulong NN_SOCKTYPE_FLAG_NOSEND = 2;
 const static ulong NN_SOL_SOCKET = 0;
 const static ulong NN_SUB_SUBSCRIBE = 1;
 const static ulong NN_SUB_UNSUBSCRIBE = 2;
 const static ulong NN_SURVEYOR_DEADLINE = 1;
 const static ulong NN_TCP = -3;
 const static ulong NN_TCP_NODELAY = 1;
 const static ulong NN_VERSION_AGE = 0;
 const static ulong NN_VERSION_CURRENT = 0;
 const static ulong NN_VERSION_REVISION = 0;

 const static ulong NN_BUS = (NN_PROTO_BUS * 16 + 0);
 const static ulong NN_MSG = -1;
 const static ulong NN_PAIR = (NN_PROTO_PAIR * 16 + 0);
 const static ulong NN_PUSH = (NN_PROTO_PIPELINE * 16 + 0);
 const static ulong NN_PULL = (NN_PROTO_PIPELINE * 16 + 1);
 const static ulong NN_ = (NN_PROTO_SUB * 16 + 0);
 const static ulong NN_SUB = (NN_PROTO_SUB * 16 + 1);
 const static ulong NN_REQ = (NN_PROTO_REQREP * 16 + 0);
 const static ulong NN_REP = (NN_PROTO_REQREP * 16 + 1);
 const static ulong NN_SURVEYOR = (NN_PROTO_SURVEY * 16 + 0);
 const static ulong NN_RESPONDENT = (NN_PROTO_SURVEY * 16 + 1);
 const static ulong EACCESS = (NN_HAUSNUMERO + 17);
 const static ulong ETERM = (NN_HAUSNUMERO + 53);
 const static ulong EFSM = (NN_HAUSNUMERO + 54);
 const static ulong NN_QUEUE_NOTINQUEUE = -1;
 const static ulong NN_LIST_NOTINLIST = -1;

struct Struct_nn_iovec {
   void* iov_base;
   ulong iov_len;
}

struct Struct_nn_msghdr {
   Struct_nn_iovec* msg_iov;
   ulong  msg_iovlen;
   void*  msg_control;
   ulong  msg_controllen;
}

struct Struct_nn_cmsghdr {
   ulong cmsg_len;
   ulong cmsg_level;
   ulong cmsg_type;
}

extern(C) {

     ulong* __errno_location();

     ulong nn_errno();

     char* nn_strerror(ulong errnum);

     char* nn_symbol(ulong i, ulong* value);

     void nn_term();

     void* nn_allocmsg(ulong size, ulong _type);

     ulong nn_freemsg(void* msg);

     ulong nn_socket(ulong domain, ulong protocol);

     ulong nn_close(ulong s);

     ulong nn_setsockopt(ulong s, 
                         ulong level, 
                         ulong option,
                         void* optval, 
                         ulong optvallen);

     ulong nn_getsockopt(ulong s, ulong level,
                         ulong option,
                         void* optval, 
                         ulong* optvallen);
     
     ulong nn_bind(ulong s, char* addr);

     ulong nn_connect(ulong s, char* addr);

     ulong nn_shutdown(ulong s, ulong how);

     ulong nn_send(ulong s, 
                   void* buf, 
                   ulong len, 
                   ulong flags);
    
     ulong nn_recv(ulong s, 
                   void* buf, 
                   ulong len, 
                   ulong flags);

     ulong nn_sendmsg(ulong s, 
                      Struct_nn_msghdr* msghdr, 
                      ulong flags);

     ulong nn_recvmsg(ulong s, 
                      Struct_nn_msghdr* msghdr,
                      ulong flags);

     ulong nn_device(ulong s1,  ulong s2);
}
