module Bitcoin::DSL
  extend Forwardable

  def bitcoin
    if self.class.respond_to?(:bitcoin)
      @client ||= Bitcoin::Client.new(self.class.bitcoin.user, self.class.bitcoin.pass, self.class.bitcoin.options)
    else
      @client ||= Bitcoin::Client.new(nil, nil)
    end
  end

  def username=(value)
    bitcoin.user = value
  end

  def password=(value)
    bitcoin.pass = value
  end

  def username(value = nil)
    value ? bitcoin.user = value : bitcoin.user
  end

  def password(value = nil)
    value ? bitcoin.pass = value : bitcoin.pass
  end

  def host(value = nil)
    value ? bitcoin.host = value : bitcoin.host
  end

  def port(value = nil)
    value ? bitcoin.port = value : bitcoin.port
  end

  def ssl(value = nil)
    value.nil? ? bitcoin.ssl : bitcoin.ssl = value
  end

  def_delegators :bitcoin,
    :ssl=,
    :port=,
    :host=,
    :ssl?,
    :backupwallet,
    :getaccount,
    :getaccountaddress,
    :getaddressesbyaccount,
    :getbalance,
    :getblockbycount,
    :getblock,
    :getblockcount,
    :getblocknumber,
    :getconnectioncount,
    :getdifficulty,
    :getgenerate,
    :gethashespersec,
    :getinfo,
    :getmininginfo,
    :getnewaddress,
    :getreceivedbyaccount,
    :getreceivedbyaddress,
    :gettransaction,
    :getrawtransaction,
    :decoderawtransaction,
    :getwork,
    :help,
    :listaccounts,
    :listreceivedbyaccount,
    :listreceivedbyaddress,
    :listtransactions,
    :listsinceblock,
    :move,
    :sendfrom,
    :sendtoaddress,
    :settxfee,
    :setaccount,
    :setgenerate,
    :stop,
    :validateaddress,
    :keypoolrefill

  def_delegators :bitcoin,
    :account,
    :account_address,
    :addresses_by_account,
    :balance,
    :block_by_count,
    :block_count,
    :block_number,
    :connection_count,
    :difficulty,
    :generate?,
    :hashes_per_sec,
    :info,
    :mininginfo,
    :new_address,
    :received_by_account,
    :received_by_address,
    :transaction,
    :raw_transaction,
    :decode_raw_transaction,
    :work,
    :get_work,
    :accounts,
    :list_received_by_account,
    :list_received_by_address,
    :transactions,
    :list_transactions,
    :send_from,
    :send_to_address,
    :account=,
    :set_account,
    :generate=,
    :set_generate,
    :validate_address
end
